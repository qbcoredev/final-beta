QBCore = nil
PlayerData = {}
bekleme = true

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
	
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	QBCore.PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
	QBCore.PlayerData = xPlayer
end)

RegisterCommand("ambulance", function(source, args, raw)
	local player, distance = GetClosestPlayer()
	if cooldown then
        QBCore.Functions.Notify('vui lòng đợi 10 phút để thực hiện điều này', 'error')
    else
		if player ~= -1 and distance < 2.5 then
			QBCore.Functions.Notify("Không Thể Sử Dụng Khi Có Người ở gần", "error")
		else
			QBCore.Functions.TriggerCallback('pazzodoktor:doktorsOnline', function(EMSOnline, hasEnoughMoney)
				if EMSOnline <= Config.Doktor and hasEnoughMoney then
					TriggerEvent("pazzodoktor:canlan")
					TriggerServerEvent('pazzodoktor:odeme')
					bekleme = false
				else
					if EMSOnline > Config.Doktor then
						QBCore.Functions.Notify("Có Bác Sĩ Đang Online", "error")
					else
						QBCore.Functions.Notify("Bạn Không Đủ Tiền", "error")
					end	
				end
			end)
		end
         cooldown = true
         Wait(600 * 1000)
         cooldown = false
    end
end)

AddEventHandler("pazzodoktor:canlan", function()
    player = GetPlayerPed(-1)
    playerPos = GetEntityCoords(player)

    local doktorkod = GetHashKey(doktorPed.model)
    RequestModel(doktorkod)

    while not HasModelLoaded(doktorkod) and RequestModel(doktorkod) do
        RequestModel(doktorkod)
        Citizen.Wait(0)
    end

    	--if DoesEntityExist(doktorkod) then
			DoktorNPC(playerPos.x, playerPos.y, playerPos.x, doktorkod)
		--else
		--	DoktorNPC(playerPos.x, playerPos.y, playerPos.x, doktorkod)
		--end
		ClearPedTasksImmediately(player)
end)

function DoktorNPC(x, y, z, doktorkod)
        
        DoktorP = CreatePed(4, doktorkod, GetEntityCoords(player), spawnHeading, true, false)  
		
		RequestAnimDict("mini@cpr@char_a@cpr_str")
		while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
		Citizen.Wait(1000)
		end
		
		TaskPlayAnim(DoktorP, "mini@cpr@char_a@cpr_str","cpr_pumpchest",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		
		cagirma(DoktorP)
end

function cagirma(DoktorP)
	if Config.MythicProgbar then
        exports['mythic_progbar']:Progress({
        	name = "AI-Doctor_givingtreatment",
        	duration = 20000,
        	label = _U('getting_treatment'),
        	useWhileDead = true,
        	canCancel = false,
        	controlDisables = {
        		disableMovement = true,
        		disableCarMovement = true,
        		disableMouse = false,
        		disableCombat = true,
        	},
        })
        Citizen.Wait(20000)
        	ClearPedTasks(DoktorP)
			Tedavi(DoktorP)
	else
		QBCore.Functions.Notify("Bạn Đang Được Cứu", "success")
		Citizen.Wait(20000)
        ClearPedTasks(DoktorP)
		Tedavi(DoktorP)
	end	
end

function Tedavi(DoktorP)
    Citizen.Wait(500)
	--TriggerEvent('esx_ambulancejob:revive')
	TriggerEvent('hospital:client:Revive')
	QBCore.Functions.Notify("Bạn Đã Được Cứu", "success")
	--notification(_U('treatment_done')..Config.Price..Config.MoneyFormat, 'success')
	RemovePedElegantly(DoktorP)
	bekleme = true
end

function notification(text, type)
	if Config.MythicNotify then
		if type == nil then
			type = 'inform'
		end
    	exports['mythic_notify']:DoHudText(type, text)
	else
		QBCore.Functions.Notify(text, "error")
		--ESX.ShowNotification(text)
	end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end