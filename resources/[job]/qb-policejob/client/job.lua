function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function Input(Titel, Placeholder, MaxLenght)
	AddTextEntry('FMMC_KEY_TIP1', Titel)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", Placeholder, "", "", "", MaxLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result --Returns the result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

local currentGarage = 1
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if isLoggedIn then
            if PlayerJob.name == "police" then
                local pos = GetEntityCoords(PlayerPedId())

                for k, v in pairs(Config.Locations["duty"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 5 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            if not onDuty then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Nhận Ca Trực")
                            else
                                DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Dừng Ca Trực")
                            end
                            if IsControlJustReleased(0, 38) then
                                onDuty = not onDuty
                                TriggerServerEvent("police:server:UpdateCurrentCops")
                                TriggerServerEvent("QBCore:ToggleDuty")
                                TriggerServerEvent("police:server:UpdateBlips")
                                TriggerEvent('qb-policealerts:ToggleDuty', onDuty)
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            DrawText3D(v.x, v.y, v.z, "Nhận/Dừng Ca Trực")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["evidence"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 2 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -    Kho Tang Chứng")
                            if IsControlJustReleased(0, 38) then
                                local drawer = Input("Which drawer do you want to look at?", "", 2)
                                if drawer ~= nil then
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", " 1 | Ngăn kéo "..drawer, {
                                        maxweight = 4000000,
                                        slots = 500,
                                    })
                                    TriggerEvent("inventory:client:SetCurrentStash", " 1 | Ngăn kéo "..drawer)
                                end
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            DrawText3D(v.x, v.y, v.z, "Stash 1")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["evidence2"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 2 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Kho Tang Chứng")
                            if IsControlJustReleased(0, 38) then
                                local drawer = Input("Which drawer do you want to look at?", "", 2)
                                if drawer ~= nil then
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", " 2 | Ngăn Kéo "..drawer, {
                                        maxweight = 4000000,
                                        slots = 500,
                                    })
                                    TriggerEvent("inventory:client:SetCurrentStash", " 2 | Ngăn Kéo "..drawer)
                                end
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            DrawText3D(v.x, v.y, v.z, "Stash 2")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["evidence3"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 2 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Kho Tang Chứng")
                            if IsControlJustReleased(0, 38) then
                                local drawer = Input("Which drawer do you want to look at?", "", 2)
                                if drawer ~= nil then
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", " 3 | Ngăn Kéo "..drawer, {
                                        maxweight = 4000000,
                                        slots = 500,
                                    })
                                    TriggerEvent("inventory:client:SetCurrentStash", " 3 | Ngăn Kéo "..drawer)
                                end
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            DrawText3D(v.x, v.y, v.z, "Stash 3")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["trash"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 2 then
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                            DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Thùng Rác")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "policetrash", {
                                    maxweight = 4000000,
                                    slots = 300,
                                })
                                TriggerEvent("inventory:client:SetCurrentStash", "policetrash")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            DrawText3D(v.x, v.y, v.z, "Thùng Rác")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 7.5 then
                         if onDuty then
                             DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                             if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                 if IsPedInAnyVehicle(PlayerPedId(), false) then
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Cất Xe")
                                 else
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Lấy Xe")
                                 end
                                 if IsControlJustReleased(0, 38) then
                                     if IsPedInAnyVehicle(PlayerPedId(), false) then
                                         QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                                     else
                                         MenuGarage()
                                         currentGarage = k
                                         Menu.hidden = not Menu.hidden
                                     end
                                 end
                                 Menu.renderGUI()
                             end  
                         end
                     end
                end

                for k, v in pairs(Config.Locations["impound"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 7.5 then
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Giam Chiếc Xe Này")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Xe Bị Giam")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                                    else
                                        MenuImpound()
                                        currentGarage = k
                                        Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["helicopter"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 7.5 then
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Cất Trực Thăng")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Lấy Trực Thăng")
                                end
                                if IsControlJustReleased(0, 38) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                                    else
                                        local coords = Config.Locations["helicopter"][k]
                                        QBCore.Functions.SpawnVehicle(Config.Helicopter, function(veh)
				            SetVehicleLivery(veh , 0)
					    SetVehicleMod(veh, 0, 48)
                                            SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.w)
                                            exports['LegacyFuel']:SetFuel(veh, 100.0)
                                            closeMenuFull()
                                            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                            SetVehicleEngineOn(veh, true, true)
                                        end, coords, true)
                                    end
                                end
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["armory"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 and IsArmoryWhitelist() then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Kho Súng")
                                if IsControlJustReleased(0, 38) then
                                    local authorizedItems = {
                                        label = "Police Armory",
                                        slots = 30,
                                        items = {}
                                    }
                                    local index = 1
                                    for _, armoryItem in pairs(Config.Items.items) do
                                        for i=1, #armoryItem.authorizedJobGrades do
                                            if armoryItem.authorizedJobGrades[i] == PlayerJob.grade.level then
                                                authorizedItems.items[index] = armoryItem
                                                authorizedItems.items[index].slot = index
                                                index = index + 1
                                            end
                                        end
                                    end
                                    SetWeaponSeries()
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "police", authorizedItems)
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                DrawText3D(v.x, v.y, v.z, "Kho Súng")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["stash"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Kho Đồ Cá Nhân")
                                if IsControlJustReleased(0, 38) then
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "policestash_"..QBCore.Functions.GetPlayerData().citizenid)
                                    TriggerEvent("inventory:client:SetCurrentStash", "policestash_"..QBCore.Functions.GetPlayerData().citizenid)
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                DrawText3D(v.x, v.y, v.z, "Kho Đồ Cá Nhân")
                            end  
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fingerprint"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if onDuty then
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Quét Vân Tay")
                                if IsControlJustReleased(0, 38) then
                                    local player, distance = GetClosestPlayer()
                                    if player ~= -1 and distance < 2.5 then
                                        local playerId = GetPlayerServerId(player)
                                        TriggerServerEvent("police:server:showFingerprint", playerId)
                                    else
                                        QBCore.Functions.Notify("Không Có AI Ở Gần!", "error")
                                    end
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                DrawText3D(v.x, v.y, v.z, "Quét Vân Tay")
                            end  
                        end
                    end
                end
            else
                Citizen.Wait(2000)
            end
        end
    end
end)

local inFingerprint = false
local FingerPrintSessionId = nil

RegisterNetEvent('police:client:showFingerprint')
AddEventHandler('police:client:showFingerprint', function(playerId)
    openFingerprintUI()
    FingerPrintSessionId = playerId
end)

RegisterNetEvent('police:client:showFingerprintId')
AddEventHandler('police:client:showFingerprintId', function(fid)
    SendNUIMessage({
        type = "updateFingerprintId",
        fingerprintId = fid
    })
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNUICallback('doFingerScan', function(data)
    TriggerServerEvent('police:server:showFingerprintId', FingerPrintSessionId)
end)

function openFingerprintUI()
    SendNUIMessage({
        type = "fingerprintOpen"
    })
    inFingerprint = true
    SetNuiFocus(true, true)
end

RegisterNUICallback('closeFingerprint', function()
    SetNuiFocus(false, false)
    inFingerprint = false
end)

RegisterNetEvent('police:client:SendEmergencyMessage')
AddEventHandler('police:client:SendEmergencyMessage', function(message)
    local coords = GetEntityCoords(PlayerPedId())
    
    TriggerServerEvent("police:server:SendEmergencyMessage", coords, message)
    TriggerEvent("police:client:CallAnim")
end)

RegisterNetEvent('police:client:EmergencySound')
AddEventHandler('police:client:EmergencySound', function()
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('police:client:CallAnim')
AddEventHandler('police:client:CallAnim', function()
    local isCalling = true
    local callCount = 5
    loadAnimDict("cellphone@")   
    TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 3.0, -1, -1, 49, 0, false, false, false)
    Citizen.Wait(1000)
    Citizen.CreateThread(function()
        while isCalling do
            Citizen.Wait(1000)
            callCount = callCount - 1
            if callCount <= 0 then
                isCalling = false
                StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 1.0)
            end
        end
    end)
end)

RegisterNetEvent('police:client:depot')
AddEventHandler('police:client:depot', function(fullImpound, price)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local bodyDamage = math.ceil(GetVehicleBodyHealth(vehicle))
    local engineDamage = math.ceil(GetVehicleEngineHealth(vehicle))
    local totalFuel = exports['LegacyFuel']:GetFuel(vehicle)
    if vehicle ~= 0 and vehicle ~= nil then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent("police:server:Depot", plate, fullImpound, price, bodyDamage, engineDamage, totalFuel)
            if price >= 2000 and price <= 5000 then
                QBCore.Functions.DeleteVehicle(vehicle)
            end
        end
    end
end)

RegisterNetEvent('police:client:ImpoundVehicle')
AddEventHandler('police:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local bodyDamage = math.ceil(GetVehicleBodyHealth(vehicle))
    local engineDamage = math.ceil(GetVehicleEngineHealth(vehicle))
    local totalFuel = exports['LegacyFuel']:GetFuel(vehicle)
    if vehicle ~= 0 and vehicle ~= nil then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent("police:server:Impound", plate, fullImpound, price, bodyDamage, engineDamage, totalFuel)
            QBCore.Functions.DeleteVehicle(vehicle)
        end
    end
end)


RegisterNetEvent('police:client:CheckStatus')
AddEventHandler('police:client:CheckStatus', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "police" then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                QBCore.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
                    if result ~= nil then
                        for k, v in pairs(result) do
                            TriggerEvent("chatMessage", "STATUS", "warning", v)
                        end
                    end
                end, playerId)
            else
                QBCore.Functions.Notify("không có ai ở gần", "error")
            end
        end
    end)
end)

function MenuImpound()
    ped = PlayerPedId();
    MenuTitle = "Impounded"
    ClearMenu()
    Menu.addButton("Police Impound", "ImpoundVehicleList", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil) 
end

function ImpoundVehicleList()
    QBCore.Functions.TriggerCallback("police:GetImpoundedVehicles", function(result)
        ped = PlayerPedId();
        MenuTitle = "Xe Bị Giam:"
        ClearMenu()

        if result == nil then
            QBCore.Functions.Notify("Không Có Xe Nào Bị Giam", "error", 5000)
            closeMenuFull()
        else
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel

                Menu.addButton(QBCore.Shared.Vehicles[v.vehicle]["name"], "TakeOutImpound", v, "Impounded", " Engine: " .. enginePercent .. "%", " Body: " .. bodyPercent.. "%", " Fuel: "..currentFuel.. "%")
            end
        end
            
        Menu.addButton("Trở Lại", "MenuImpound",nil)
    end)
end

function TakeOutImpound(vehicle)
    enginePercent = round(vehicle.engine / 10, 0)
    bodyPercent = round(vehicle.body / 10, 0)
    currentFuel = vehicle.fuel
    local coords = Config.Locations["impound"][currentGarage]
    findVehFromPlateAndLocate(vehicle.plate)
    QBCore.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
        QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
            QBCore.Functions.SetVehicleProperties(veh, properties)
            SetVehicleNumberPlateText(veh, vehicle.plate)
            SetEntityHeading(veh, coords.w)
            exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
            doCarDamage(veh, vehicle)
            TriggerServerEvent('police:server:TakeOutImpound',vehicle.plate)
            closeMenuFull()
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
        end, vehicle.plate)
    end, coords, true)
end

function MenuOutfits()
    ped = PlayerPedId();
    MenuTitle = "Quần ÁO"
    ClearMenu()
    Menu.addButton("Trang Phục Của Bạn", "OutfitsLijst", nil)
    Menu.addButton("Đóng menu", "closeMenuFull", nil) 
end

function changeOutfit()
	Wait(200)
    loadAnimDict("clothingshirt")    	
	TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Wait(3100)
	TaskPlayAnim(PlayerPedId(), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function OutfitsLijst()
    QBCore.Functions.TriggerCallback('apartments:GetOutfits', function(outfits)
        ped = PlayerPedId();
        MenuTitle = "Trang Phục Của Bạn :"
        ClearMenu()

        if outfits == nil then
            QBCore.Functions.Notify("You have no outfits saved...", "error", 3500)
            closeMenuFull()
        else
            for k, v in pairs(outfits) do
                Menu.addButton(outfits[k].outfitname, "optionMenu", outfits[k]) 
            end
        end
        Menu.addButton("Trở Lại", "MenuOutfits",nil)
    end)
end

function optionMenu(outfitData)
    ped = PlayerPedId();
    MenuTitle = "What now?"
    ClearMenu()

    Menu.addButton("Chọn Quần Áo", "selectOutfit", outfitData) 
    Menu.addButton("Xóa Quần Áo", "removeOutfit", outfitData) 
    Menu.addButton("Trở Lại", "OutfitsLijst",nil)
end

function selectOutfit(oData)
    TriggerServerEvent('clothes:selectOutfit', oData.model, oData.skin)
    QBCore.Functions.Notify(oData.outfitname.." Đã Chọn", "success", 2500)
    closeMenuFull()
    changeOutfit()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    QBCore.Functions.Notify(oData.outfitname.." Đã Xóa", "success", 2500)
    closeMenuFull()
end

function MenuGarage()
    ped = PlayerPedId();
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil) 
end

function VehicleList(isDown)
    ped = PlayerPedId();
    MenuTitle = "Vehicles:"
    ClearMenu()
    local authorizedVehicles = Config.AuthorizedVehicles[QBCore.Functions.GetPlayerData().job.grade.level]
    for k, v in pairs(authorizedVehicles) do
        Menu.addButton(authorizedVehicles[k], "TakeOutVehicle", k, "Garage", " Engine: 100%", " Body: 100%", " Fuel: 100%")
    end
    if IsArmoryWhitelist() then
        for veh, label in pairs(Config.WhitelistedVehicles) do
            Menu.addButton(label, "TakeOutVehicle", veh, "Garage", " Engine: 100%", " Body: 100%", " Fuel: 100%")
        end
    end
        
    Menu.addButton("Trở Lại", "MenuGarage",nil)
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]

    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
	SetCarItemsInfo()
        SetVehicleNumberPlateText(veh, "PLZI"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("inventory:server:addTrunkItems", GetVehicleNumberPlateText(veh), Config.CarItems)
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function doCarDamage(currentVehicle, veh)
	smash = false
	damageOutside = false
	damageOutside2 = false 
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0
	if engine < 200.0 then
		engine = 200.0
    end
    
    if engine  > 1000.0 then
        engine = 950.0
    end

	if body < 150.0 then
		body = 150.0
	end
	if body < 950.0 then
		smash = true
	end

	if body < 920.0 then
		damageOutside = true
	end

	if body < 920.0 then
		damageOutside2 = true
	end

    Citizen.Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
	if smash then
		SmashVehicleWindow(currentVehicle, 0)
		SmashVehicleWindow(currentVehicle, 1)
		SmashVehicleWindow(currentVehicle, 2)
		SmashVehicleWindow(currentVehicle, 3)
		SmashVehicleWindow(currentVehicle, 4)
	end
	if damageOutside then
		SetVehicleDoorBroken(currentVehicle, 1, true)
		SetVehicleDoorBroken(currentVehicle, 6, true)
		SetVehicleDoorBroken(currentVehicle, 4, true)
	end
	if damageOutside2 then
		SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
	end
	if body < 1000 then
		SetVehicleBodyHealth(currentVehicle, 985.1)
	end
end

function SetCarItemsInfo()
	local items = {}
	for k, item in pairs(Config.CarItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
		}
	end
	Config.CarItems = items
end

function IsArmoryWhitelist()
    local retval = false

    if QBCore.Functions.GetPlayerData().job.name == 'police' then
        retval = true
    end

--[[     local citizenid = QBCore.Functions.GetPlayerData().citizenid
    for k, v in pairs(Config.ArmoryWhitelist) do
        if v == citizenid then
            retval = true
            break
        end
    end ]]

    return retval
end

function SetWeaponSeries()
    for k, v in pairs(Config.Items.items) do
        if k < 6 then
            Config.Items.items[k].info.serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
        end
    end
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function findVehFromPlateAndLocate(plate)


    local gameVehicles = QBCore.Functions.GetVehicles()
  
    for i = 1, #gameVehicles do
        local vehicle = gameVehicles[i]
  
        if DoesEntityExist(vehicle) then
            if GetVehicleNumberPlateText(vehicle) == plate then
                local vehCoords = GetEntityCoords(vehicle)
                QBCore.Functions.DeleteVehicle(vehicle)
            end
        end
    end
end