local ItemTable = {
    "copper",
    "aluminum",
    "metalscrap"
}

RegisterServerEvent("qb-recycle:server:getItem")
AddEventHandler("qb-recycle:server:getItem", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for i = 1, math.random(1, 1), 1 do
        local randItem = ItemTable[math.random(1, #ItemTable)]
        local amount = math.random(1, 1)
        Player.Functions.AddItem(randItem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
        Citizen.Wait(500)
    end

    local chance = math.random(1, 100)
    if chance < 4 then
        Player.Functions.AddItem("thermite", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["thermite"], "add")
    end

    local Luck = math.random(3, 10)
    local Odd = math.random(3, 10)
    if Luck == Odd then
        local random = math.random(1, 1)
        Player.Functions.AddItem("thermite", random)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["thermite"], 'add')
    end
end)
