local OutsideVehicles = {}

-- code

RegisterServerEvent('qb-garages:server:UpdateOutsideVehicles')
AddEventHandler('qb-garages:server:UpdateOutsideVehicles', function(Vehicles)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local CitizenId = Ply.PlayerData.citizenid

    OutsideVehicles[CitizenId] = Vehicles
end)

QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleOwner", function(source, cb, plate)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?',
        {plate, pData.PlayerData.citizenid}, function(result)
            if result[1] ~= nil then
                cb(true)
            else
                cb(false)
            end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetOutsideVehicles", function(source, cb)
    local Ply = QBCore.Functions.GetPlayer(source)
    local CitizenId = Ply.PlayerData.citizenid

    if OutsideVehicles[CitizenId] ~= nil and next(OutsideVehicles[CitizenId]) ~= nil then
        cb(OutsideVehicles[CitizenId])
    else
        cb(nil)
    end
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetUserVehicles", function(source, cb, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE citizenid = ? AND garage = ?',
        {pData.PlayerData.citizenid, garage}, function(result)
            if result[1] ~= nil then
                cb(result)
            else
                cb(nil)
            end
        end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetVehicleProperties", function(source, cb, plate)
    local src = source
    local properties = {}
    local result = exports.oxmysql:fetchSync('SELECT mods FROM player_vehicles WHERE plate = ?', {plate})
    if result[1] ~= nil then
        properties = json.decode(result[1].mods)
    end
    cb(properties)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetDepotVehicles", function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE citizenid = ? AND state = ?',
        {pData.PlayerData.citizenid, 0}, function(result)
            if result[1] ~= nil then
                cb(result)
            else
                cb(nil)
            end
        end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:GetHouseVehicles", function(source, cb, house)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE garage = ?', {house}, function(result)
        if result[1] ~= nil then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

QBCore.Functions.CreateCallback("qb-garage:server:checkVehicleHouseOwner", function(source, cb, plate, house)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE plate = ?', {plate}, function(result)
        if result[1] ~= nil then
            local hasHouseKey = exports['qb-houses']:hasKey(result[1].license, result[1].citizenid, house)
            if hasHouseKey then
                cb(true)
            else
                cb(false)
            end
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('qb-garage:server:PayDepotPrice')
AddEventHandler('qb-garage:server:PayDepotPrice', function(vehicle, garage)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bankBalance = Player.PlayerData.money["bank"]
    local cashBalance = Player.PlayerData.money["cash"]
    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE plate = ?', {vehicle.plate}, function(result)
        print(result[1].depotprice)
        if result[1] ~= nil then
            if bankBalance >= result[1].depotprice then
                if result[1].depotprice == 2000 then
                    Player.Functions.RemoveMoney("bank", result[1].depotprice, "paid-depot")
                    TriggerEvent("qb-bossmenu:server:addAccountMoney", "mechanic", result[1].depotprice * 0.10)
                    TriggerEvent("qb-bossmenu:server:addAccountMoney", "police", result[1].depotprice * 0.10)
                    TriggerClientEvent("qb-garages:client:takeOutDepot", src, vehicle, garage)
                else
                    Player.Functions.RemoveMoney("bank", result[1].depotprice, "paid-depot")
                    TriggerClientEvent("qb-garages:client:takeOutDepot", src, vehicle, garage)
                    TriggerEvent("qb-bossmenu:server:addAccountMoney", "police", result[1].depotprice)
                    TriggerClientEvent('QBCore:Notify', src, "Đã Trả Tiền Cho Cảnh Sát!")
                end
            else
                if result[1].depotprice == 2000 then
                    Player.Functions.RemoveMoney("cash", result[1].depotprice, "paid-depot")
                    TriggerEvent("qb-bossmenu:server:addAccountMoney", "mechanic", result[1].depotprice * 0.10)
                    TriggerEvent("qb-bossmenu:server:addAccountMoney", "police", result[1].depotprice * 0.10)
                    TriggerClientEvent("qb-garages:client:takeOutDepot", src, vehicle, garage)
                else
                    Player.Functions.RemoveMoney("cash", result[1].depotprice, "paid-depot")
                    TriggerClientEvent("qb-garages:client:takeOutDepot", src, vehicle, garage)
                    TriggerEvent("qb-bossmenu:server:addAccountMoney", "police", result[1].depotprice)
                    TriggerClientEvent('QBCore:Notify', src, "Đã Trả Tiền Cho Cảnh Sát!")
                end
            end
        end
    end)
end)

RegisterServerEvent('qb-garage:server:updateVehicleState')
AddEventHandler('qb-garage:server:updateVehicleState', function(state, plate, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:execute('UPDATE player_vehicles SET state = ?, garage = ?, depotprice = ? WHERE plate = ?',
        {state, garage, 2000, plate})
end)

RegisterServerEvent('qb-garage:server:updateVehicleStatus')
AddEventHandler('qb-garage:server:updateVehicleStatus', function(mods, fuel, engine, body, plate, garage)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    if engine > 1000 then
        engine = engine / 1000
    end

    if body > 1000 then
        body = body / 1000
    end

    exports.oxmysql:execute(
        'UPDATE player_vehicles SET fuel = ?, engine = ?, body = ? WHERE plate = ? AND citizenid = ? AND garage = ?',
        {fuel, engine, body, plate, pData.PlayerData.citizenid, garage})
end)

RegisterServerEvent('qb-garage:server:refund')
AddEventHandler('qb-garage:server:refund', function()
    print("eheh")
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    xPlayer.Functions.AddMoney('cash', 3000)
    TriggerClientEvent('QBCore:Notify', src, "Bạn Đã Được Đền Bù!")
end)