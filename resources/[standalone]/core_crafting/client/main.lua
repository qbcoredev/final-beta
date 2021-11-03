QBCore = nil
local labels = {}
local craftingQueue = {}
local job = ""
local grade = 0

Citizen.CreateThread(
    function()
        while QBCore == nil do
            TriggerEvent(
                "QBCore:GetObject",
                function(obj)
                    QBCore = obj
                end
            )
            Citizen.Wait(0)
        end

        while QBCore.Functions.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        job = QBCore.Functions.GetPlayerData().job.name
        grade = QBCore.Functions.GetPlayerData().job.grade

        for k, v in pairs(QBCore.Shared.Items) do
            labels[k] = v.label
        end

        for _, v in ipairs(Config.Workbenches) do
            if v.blip then
                local blip = AddBlipForCoord(v.coords)

                SetBlipSprite(blip, Config.BlipSprite)
                SetBlipScale(blip, 0.8)
                SetBlipColour(blip, Config.BlipColor)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.BlipText)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler(
    "QBCore:Client:OnJobUpdate",
    function(j)
        job = j.name
        grade = j.grade
    end
)

function isNearWorkbench()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local near = false

    for _, v in ipairs(Config.Workbenches) do
        local dst = #(coords - v.coords)
        if dst < v.radius then
            near = true
        end
    end

    if near then
        return true
    else
        return false
    end
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)
            if craftingQueue[1] ~= nil then
                if not Config.CraftingStopWithDistance or (Config.CraftingStopWithDistance and isNearWorkbench()) then
                    craftingQueue[1].time = craftingQueue[1].time - 1

                    SendNUIMessage(
                        {
                            type = "addqueue",
                            item = craftingQueue[1].item,
                            time = craftingQueue[1].time,
                            id = craftingQueue[1].id
                        }
                    )

                    if craftingQueue[1].time == 0 then
                        TriggerServerEvent("core_crafting:itemCrafted", craftingQueue[1].item, craftingQueue[1].count)
                        table.remove(craftingQueue, 1)
                    end
                end
            end
        end
    end
)

function openWorkbench(val)
    local inv = {}
    local recipes = {}
    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(1000)
    local player = QBCore.Functions.GetPlayerData()
    local xp = player.metadata['craftingrep']
    for _, v in ipairs(player.items) do
        inv[v.name] = v.amount
    end

    if #val.recipes > 0 then
        for _, g in ipairs(val.recipes) do
            recipes[g] = Config.Recipes[g]
        end
    else
        recipes = Config.Recipes
    end

    SendNUIMessage ({
        type = "open",
        recipes = recipes,
        names = labels,
        level = xp,
        inventory = inv,
        job = job,
        grade = grade,
        hidecraft = Config.HideWhenCantCraft,
        categories = Config.Categories
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for _, v in ipairs(Config.Workbenches) do
            local dst = #(coords - v.coords)
            if dst < 20 then
                DrawText3D(v.coords[1], v.coords[2], v.coords[3] - 0.8, '~o~[E] Bàn Chế Tạo~w~')
            end
            if dst < 2 then
                if IsControlJustReleased(0, 38) then
                    local open = false
                    for _, g in ipairs(v.jobs) do
                        if g == job then
                            open = true
                        end
                    end

                    if open or #v.jobs == 0 then
                        openWorkbench(v)
                    else
                        QBCore.Functions.Notify('Bạn không được phép làm điều này', 'error')
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("open:workbench")
AddEventHandler("open:workbench", function()
    for _, v in ipairs(Config.Workbenches) do
        local open = false
        for _, g in ipairs(v.jobs) do
            if g == job then
                open = true
            end
        end

        if open or #v.jobs == 0 then
            openWorkbench(v)
        else
            QBCore.Functions.Notify('Bạn không được phép làm điều này', 'error')
        end
    end
end)

RegisterNetEvent("core_crafting:craftStart")
AddEventHandler(
    "core_crafting:craftStart",
    function(item, count)
        local id = math.random(000, 999)
        table.insert(craftingQueue, {time = Config.Recipes[item].Time, item = item, count = 1, id = id})

        SendNUIMessage(
            {
                type = "crafting",
                item = item
            }
        )

        SendNUIMessage(
            {
                type = "addqueue",
                item = item,
                time = Config.Recipes[item].Time,
                id = id
            }
        )
    end
)

RegisterNUICallback(
    "close",
    function(data)
        TriggerScreenblurFadeOut(1000)
        SetNuiFocus(false, false)
    end
)

RegisterNUICallback(
    "craft",
    function(data)
        local item = data["item"]
        TriggerServerEvent("core_crafting:craft", item, false)
    end
)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = ((1 / dist) * 2) * (1 / GetGameplayCamFov()) * 100

    if onScreen then
        SetTextColour(255, 255, 255, 255)
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextCentre(true)

        SetTextDropshadow(1, 1, 1, 1, 255)

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55 * scale, 4)
        local width = EndTextCommandGetWidth(4)

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end
