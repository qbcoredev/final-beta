ESX = nil

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('lockpick:openhtml')
AddEventHandler('lockpick:openhtml', function(door, isAdvanced)
	print("openhtml",door)
	TriggerClientEvent('lockpick:openlockpick', source, door, isAdvanced)
end)

-- để nguyên esx hả ?