local HasKey = false
local LastVehicle = nil
local IsHotwiring = false
local IsRobbing = false
local isLoggedIn = false
local NeededAttempts = 0
local SucceededAttempts = 0
local FailedAttemps = 0
local AlertSend = false


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if QBCore ~= nil then
            local ped = PlayerPedId()
	    local vehicle = GetVehiclePedIsIn(ped)
            if IsPedInAnyVehicle(ped, false) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped, true), -1) == ped then
                local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, true))
                if LastVehicle ~= GetVehiclePedIsIn(ped, false) then
                    QBCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
                        if result then
                            HasKey = true
                            SetVehicleEngineOn(vehicle, true, false, true)
                        else
                            HasKey = false
                            SetVehicleEngineOn(vehicle, false, false, true)
                        end
                        LastVehicle = GetVehiclePedIsIn(ped, false)
                    end, plate)
                end
            else
                if SucceededAttempts ~= 0 then
                    SucceededAttempts = 0
                end
                if NeededAttempts ~= 0 then
                    NeededAttempts = 0
                end
                if FailedAttemps ~= 0 then
                    FailedAttemps = 0
                end
            end
        end

        if not HasKey and IsPedInAnyVehicle(ped, false) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped and QBCore ~= nil and not IsHotwiring then
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleEngineOn(veh, false, false, true)
            --[[local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local vehpos = GetOffsetFromEntityInWorldCoords(veh, 0, 1.5, 0.5)
            QBCore.Functions.DrawText3D(vehpos.x, vehpos.y, vehpos.z, "~g~H~w~ - Hotwire")
            SetVehicleEngineOn(veh, false, false, true)

            if IsControlJustPressed(0, 74) then
                Hotwire()
            end]]--
        end

        if IsControlJustPressed(1, 182) then
            LockVehicle()
        end
			
	if (GetVehicleDoorLockStatus(vehicle) == 2) then
            DisableControlAction(1, 75, true)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        if not IsRobbing and isLoggedIn and QBCore ~= nil then
            local ped = PlayerPedId()
            if GetVehiclePedIsTryingToEnter(ped) ~= nil and GetVehiclePedIsTryingToEnter(ped) ~= 0 then
                local vehicle = GetVehiclePedIsTryingToEnter(ped)
                local driver = GetPedInVehicleSeat(vehicle, -1)
                if driver ~= 0 and not IsPedAPlayer(driver) then
                    if IsEntityDead(driver) then
                        IsRobbing = true
                        QBCore.Functions.Progressbar("rob_keys", "Grabbing keys..", 3000, false, true, {}, {}, {}, {}, function() -- Done
                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
                            HasKey = true
                            IsRobbing = false
                        end)
                    end
                end
            end

            --[[if QBCore.Functions.GetPlayerData().job.name ~= "police" then
                local aiming, target = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if aiming and (target ~= nil and target ~= 0) then
                    if DoesEntityExist(target) and not IsPedAPlayer(target) then
                        if IsPedInAnyVehicle(target, false) and not IsPedInAnyVehicle(PlayerPedId(), false ) then
                            if not IsBlacklistedWeapon() then
                                local pos = GetEntityCoords(PlayerPedId(), true)
                                local targetpos = GetEntityCoords(target, true)
                                local vehicle = GetVehiclePedIsIn(target, true)
                                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, targetpos.x, targetpos.y, targetpos.z, true) < 13.0 then
                                    RobVehicle(target)
                                end
                            end
                        end
                    end
                end
            end]]--
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('vehiclekeys:client:SetOwner')
AddEventHandler('vehiclekeys:client:SetOwner', function(plate)
    local VehPlate = plate
    if VehPlate == nil then
        VehPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), true))
    end
    TriggerServerEvent('vehiclekeys:server:SetVehicleOwner', VehPlate)
    if IsPedInAnyVehicle(PlayerPedId()) and plate == GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), true)) then
        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), true), true, false, true)
    end
    HasKey = true
    --QBCore.Functions.Notify('You picked the keys of the vehicle', 'success', 3500)
end)

RegisterNetEvent('vehiclekeys:client:GiveKeys')
AddEventHandler('vehiclekeys:client:GiveKeys', function(target)
    local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), true))
    TriggerServerEvent('vehiclekeys:server:GiveVehicleKeys', plate, target)
end)

RegisterNetEvent('vehiclekeys:client:ToggleEngine')
AddEventHandler('vehiclekeys:client:ToggleEngine', function()
    local EngineOn = IsVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()))
    local veh = GetVehiclePedIsIn(PlayerPedId(), true)
    if HasKey then
        if EngineOn then
            SetVehicleEngineOn(veh, false, false, true)
        else
            SetVehicleEngineOn(veh, true, false, true)
        end
    end
end)
local DangLock = false

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function(isAdvanced)
    if (IsPedInAnyVehicle(PlayerPedId(-1))) then
        if not HasKey then
            Citizen.Wait(50)
            ped = PlayerPedId(-1)
			local vehCheck = GetEntityModel(GetVehiclePedIsIn(ped),false)
			if (IsPedInAnyVehicle(ped)) then
				if not HasKey then
					if DangLock then
						QBCore.Functions.Notify("Bạn đang bẻ khóa.", "error")
					else
						print('Lockpick')
						local qCall = TriggerServerEvent("lockpick:openhtml", false, isAdvanced)
						if qCall then
							PoliceCall()
						end
					end
				end
			else
				QBCore.Functions.Notify("Bạn không có trên xe.")
			end
		end
    else
        LockpickDoor(isAdvanced)
    end
end)


function RobVehicle(target)
    IsRobbing = true
    Citizen.CreateThread(function()
        while IsRobbing do
            local RandWait = math.random(10000, 15000)
            loadAnimDict("random@mugging3")

            TaskLeaveVehicle(target, GetVehiclePedIsIn(target, true), 256)
            Citizen.Wait(1000)
            ClearPedTasksImmediately(target)

            TaskStandStill(target, RandWait)
            TaskHandsUp(target, RandWait, PlayerPedId(), 0, false)

            Citizen.Wait(RandWait)

            --TaskReactAndFleePed(target, PlayerPedId())
            IsRobbing = false
        end
    end)
end

function LockVehicle()
    local ped = PlayerPedId()
    local veh = QBCore.Functions.GetClosestVehicle()
    local coordA = GetEntityCoords(ped, true)
    local coordB = GetOffsetFromEntityInWorldCoords(ped, 0.0, 255.0, 0.0)
    local veh = GetClosestVehicleInDirection(coordA, coordB)
    local pos = GetEntityCoords(ped, true)
    if IsPedInAnyVehicle(ped) then
        veh = GetVehiclePedIsIn(ped)
    end
    local plate = GetVehicleNumberPlateText(veh)
    local vehpos = GetEntityCoords(veh, false)
    if veh ~= nil and #(pos - vehpos) < 7.5 then
        QBCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
            if result then
                if HasKey then
                    local vehLockStatus = GetVehicleDoorLockStatus(veh)
                    loadAnimDict("anim@mp_player_intmenu@key_fob@")
                    TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click' ,3.0, 3.0, -1, 49, 0, false, false, false)
        
                    if vehLockStatus == 1 then
                        Citizen.Wait(750)
                        ClearPedTasks(ped)
                        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                        SetVehicleDoorsLocked(veh, 2)
                        if(GetVehicleDoorLockStatus(veh) == 2)then
                            QBCore.Functions.Notify("Xe Bị Khóa!")
                        else
                            QBCore.Functions.Notify("Đã xảy ra lỗi với hệ thống khóa!")
                        end
                    else
                        Citizen.Wait(750)
                        ClearPedTasks(ped)
                        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "unlock", 0.3)
                        SetVehicleDoorsLocked(veh, 1)
                        if(GetVehicleDoorLockStatus(veh) == 1)then
                            QBCore.Functions.Notify("Xe Bị Khóa!")
                        else
                            QBCore.Functions.Notify("Đã xảy ra lỗi với hệ thống khóa!")
                        end
                    end
        
                    if not IsPedInAnyVehicle(ped) then
                        SetVehicleInteriorlight(veh, true)
                        SetVehicleIndicatorLights(veh, 0, true)
                        SetVehicleIndicatorLights(veh, 1, true)
                        Citizen.Wait(450)
                        SetVehicleIndicatorLights(veh, 0, false)
                        SetVehicleIndicatorLights(veh, 1, false)
                        Citizen.Wait(450)
                        SetVehicleInteriorlight(veh, true)
                        SetVehicleIndicatorLights(veh, 0, true)
                        SetVehicleIndicatorLights(veh, 1, true)
                        Citizen.Wait(450)
                        SetVehicleInteriorlight(veh, false)
                        SetVehicleIndicatorLights(veh, 0, false)
                        SetVehicleIndicatorLights(veh, 1, false)
                    end
                end
            else
                QBCore.Functions.Notify('Bạn Không Có Khóa Của Xe Này..', 'error')
            end
        end, plate)
    end
end

local openingDoor = false

RegisterNetEvent('vehiclekeys:client:Kqlockpick_Ui')
AddEventHandler('vehiclekeys:client:Kqlockpick_Ui', function(door, kq)
	Citizen.Wait(100)
	local src = source
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
	if door then
		vehicle = QBCore.Functions.GetClosestVehicle()
		if kq == "win" then
            local randChance = math.random(1,5)
			openingDoor = false
			StopAnimTask(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
			IsHotwiring = false
			QBCore.Functions.Notify("Door open!")
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "unlock", 0.3)
			SetVehicleDoorsLocked(vehicle, 0)
			SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            if randChance == 3 then
                TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)   
            end
		else
            local randChance = math.random(1,5)
			openingDoor = false
			StopAnimTask(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
			QBCore.Functions.Notify("Failed!", "error")
			IsHotwiring = false
            if randChance == 3 then
                TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)   
            end
		end
	else
		if kq == "win" then
            local randChance = math.random(1,5)
            print(randChance)
			HasKey = true
			QBCore.Functions.Notify("Bẻ khóa thành công.") 
			TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
			Citizen.Wait(200)
			SetVehicleEngineOn(vehicle, true, false, true)
            if randChance == 3 then
                TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)   
            end
		else
            local randChance = math.random(1,5)
			QBCore.Functions.Notify("Bẻ khóa thất bại.", "error")
			--TriggerServerEvent("vehiclekeys:server:DelLockpick", src, kq)
            if randChance == 3 then
                TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
            end                                                                                                          
		end
	end
end)

function LockpickDoor(isAdvanced)
	print('LockpickDoor')
	local src = true
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if vehicle ~= nil and vehicle ~= 0 then
        local ped = PlayerPedId()
        local vehpos = GetEntityCoords(vehicle)
        local pos = GetEntityCoords(ped)
        if #(pos - vehpos) < 1.5 then
            local vehLockStatus = GetVehicleDoorLockStatus(vehicle)
				if (vehLockStatus > 1) then
				local lockpickTime = 30000
				LockpickDoorAnim(lockpickTime)
				PoliceCall()
				IsHotwiring = true
				Citizen.Wait(50)
				ped = PlayerPedId(-1)
				local door = true
				TriggerServerEvent("lockpick:openhtml", src, door, isAdvanced)
            end
        end
    end
end

function Hotwire()
    if not HasKey then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, true)
        IsHotwiring = true
        local hotwireTime = math.random(20000, 40000)
        SetVehicleAlarm(vehicle, true)
        SetVehicleAlarmTimeLeft(vehicle, hotwireTime)
        PoliceCall()
        QBCore.Functions.Progressbar("hotwire_vehicle", "Engaging the ignition switch", hotwireTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
            flags = 16,
        }, {}, {}, function() -- Done
            StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            if (math.random(0, 100) < 10) then
                HasKey = true
                QBCore.Functions.Notify("Hotwire succeeded!")
            else
                HasKey = false
                SetVehicleEngineOn(veh, false, false, true)
                QBCore.Functions.Notify("Hotwire failed!", "error")
            end
            IsHotwiring = false
        end, function() -- Cancel
            StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            HasKey = false
            SetVehicleEngineOn(veh, false, false, true)
            QBCore.Functions.Notify("Hotwire failed!", "error")
            IsHotwiring = false
        end)
    end
end

function PoliceCall()
    if not AlertSend then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local chance = 20
        if GetClockHours() >= 1 and GetClockHours() <= 6 then
            chance = 10
        end
        if math.random(1, 100) <= chance then
            local closestPed = GetNearbyPed()
            if closestPed ~= nil then
                local msg = ""
                local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                local streetLabel = GetStreetNameFromHashKey(s1)
                local street2 = GetStreetNameFromHashKey(s2)
                if street2 ~= nil and street2 ~= "" then 
                    streetLabel = streetLabel .. " " .. street2
                end
                local alertTitle = ""
                if IsPedInAnyVehicle(ped) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
                    if QBCore.Shared.Vehicles[modelName] ~= nil then
                        Name = QBCore.Shared.Vehicles[modelName]["model"] .. ' ' .. QBCore.Shared.Vehicles[modelName]["model"]["name"]
                    else
                        Name = "Unknown"
                    end
                    local modelPlate = GetVehicleNumberPlateText(vehicle)
                    local msg = "Vehicle theft attempt at " ..streetLabel.. ". Vehicle: " .. Name .. ", Licenseplate: " .. modelPlate
                    local alertTitle = "Vehicle theft attempt at"
                    TriggerServerEvent("police:server:VehicleCall", pos, msg, alertTitle, streetLabel, modelPlate, Name)
                else
                    local vehicle = QBCore.Functions.GetClosestVehicle()
                    local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
                    local modelPlate = GetVehicleNumberPlateText(vehicle)
                    if QBCore.Shared.Vehicles[modelName] ~= nil then
                        Name = QBCore.Shared.Vehicles[modelName]["model"] .. ' ' .. QBCore.Shared.Vehicles[modelName]["model"]["name"]
                    else
                        Name = "Unknown"
                    end
                    local msg = "Vehicle theft attempt at " ..streetLabel.. ". Vehicle: " .. Name .. ", Licenseplate: " .. modelPlate
                    local alertTitle = "Vehicle theft attempt at"
                    TriggerServerEvent("police:server:VehicleCall", pos, msg, alertTitle, streetLabel, modelPlate, Name)
                end
            end
        end
        AlertSend = true
        SetTimeout(2 * (60 * 1000), function()
            AlertSend = false
        end)
    end
end

function GetClosestVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		
		offset = offset - 1

		if vehicle ~= 0 then break end
	end
	
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	
	if distance > 250 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function GetNearbyPed()
	local retval = nil
	local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
	local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
	if not IsEntityDead(closestPed) and closestDistance < 30.0 then
		retval = closestPed
	end
	return retval
end

function IsBlacklistedWeapon()
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    if weapon ~= nil then
        for _, v in pairs(Config.NoRobWeapons) do
            if weapon == GetHashKey(v) then
                return true
            end
        end
    end
    return false
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

RegisterKeyMapping('enginetoggle', 'Turn the Engine on or off', 'keyboard', 'K')


RegisterCommand("enginetoggle", function()
    TriggerEvent('vehiclekeys:client:ToggleEngine', source)
end)