ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('lockpick:openlockpick')
AddEventHandler('lockpick:openlockpick', function(door, isAdvanced)
	print('lockpick:openlockpick',door)
	SetNuiFocus( true, true )
	SendNUIMessage({
		showPlayerMenu = true,
		typebekhoa = isAdvanced,
		typedoor = door,
	})
end)

