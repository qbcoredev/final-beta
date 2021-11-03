QBCore = nil

local searched = {3423423424}
local canSearch = true
local dumpsters = {218085040, 666561306, -58485588, -206690185, 1511880420, 682791951}
local searchTime = 8000

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if canSearch then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local dumpsterFound = false

            for i = 1, #dumpsters do
                local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters[i], false, false, false)
                local dumpPos = GetEntityCoords(dumpster)
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true)

                if dist < 1.8 then
                    DrawText3D2(dumpPos.x, dumpPos.y, dumpPos.z + 1.0, '[~y~E~w~] để bới thùng rác')
                    if IsControlJustReleased(0, 54) then
                        for i = 1, #searched do
                            if searched[i] == dumpster then
                                dumpsterFound = true
                            end
                            if i == #searched and dumpsterFound then
                               
                          --      exports['swt_notifications']:Negative("Hệ thống","Thùng rác này đã có người bới","top","3000",true)
                                QBCore.Functions.Notify('Thùng rác này đã có người bới', 'error', 2500)  
                            elseif i == #searched and not dumpsterFound then
                                QBCore.Functions.Notify('bạn đang bới thùng rác', 'success', 2500) 
                                
                                
                                startSearching(searchTime, 'pixellife:giveDumpsterReward')
                                TriggerServerEvent('pixellife:startDumpsterTimer', dumpster)
                                table.insert(searched, dumpster)
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('pixellife:removeDumpster')
AddEventHandler('pixellife:removeDumpster', function(object)
    for i = 1, #searched do
        if searched[i] == object then
            table.remove(searched, i)
        end
    end
end)

-- Function

function startSearching(time, cb)
 
    local ped = GetPlayerPed(-1)

    canSearch = false

    
    Progressbar(8000,"Bới thùng rác..")
   

    local ped = GetPlayerPed(-1)

    --Wait(time)
    ClearPedTasks(ped)
    canSearch = true
    TriggerServerEvent(cb)
end

------------------------------------TEXT DRAW3D-----------------------------------
function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
  
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end
----------------------------------------------------------------------------------

function Progressbar(duration, label)
	local retval = nil
	QBCore.Functions.Progressbar("dumpsters", label, duration, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = true,
		disableCombat = true,
	}, {animDict = "amb@prop_human_bum_bin@base",
    anim = "base",
    flags = 16,
}, {}, {}, function()
		retval = true
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@base", "base", 1.0)
	end, function()
		retval = false
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@base", "base", 1.0)
	end)

	while retval == nil do
		Wait(1)
	end

	return retval
end