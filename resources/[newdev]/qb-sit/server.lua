QBCore = nil
local seatsTaken = {}

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterNetEvent('qb-sit:takePlace')
AddEventHandler('qb-sit:takePlace', function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent('qb-sit:leavePlace')
AddEventHandler('qb-sit:leavePlace', function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

QBCore.Functions.CreateCallback('qb-sit:getPlace', function(source, cb, objectCoords)
	cb(seatsTaken[objectCoords])
end)