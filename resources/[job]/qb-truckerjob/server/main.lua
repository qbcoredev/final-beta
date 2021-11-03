local PaymentTax = 10
local Bail = {}

RegisterServerEvent('qb-trucker:server:DoBail')
AddEventHandler('qb-trucker:server:DoBail', function(bool, vehInfo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if bool then
        if Player.PlayerData.money.cash >= Config.BailPrice then
            Bail[Player.PlayerData.citizenid] = Config.BailPrice
            Player.Functions.RemoveMoney('cash', Config.BailPrice, "tow-received-bail")
            TriggerClientEvent('QBCore:Notify', src, '$250 Deposit Paid With Cash', 'success')
            TriggerClientEvent('qb-trucker:client:SpawnVehicle', src, vehInfo)
        elseif Player.PlayerData.money.bank >= Config.BailPrice then
            Bail[Player.PlayerData.citizenid] = Config.BailPrice
            Player.Functions.RemoveMoney('bank', Config.BailPrice, "tow-received-bail")
            TriggerClientEvent('QBCore:Notify', src, '$250 Deposit Paid From Bank', 'success')
            TriggerClientEvent('qb-trucker:client:SpawnVehicle', src, vehInfo)
        else
            TriggerClientEvent('QBCore:Notify', src, '$250 Deposit Required', 'error')
        end
    else
        if Bail[Player.PlayerData.citizenid] ~= nil then
            Player.Functions.AddMoney('cash', Bail[Player.PlayerData.citizenid], "trucker-bail-paid")
            Bail[Player.PlayerData.citizenid] = nil
            TriggerClientEvent('QBCore:Notify', src, '$500 Tiền cọc đã được trả lại ', 'success')
        end
    end
end)

RegisterNetEvent('qb-trucker:server:01101110')
AddEventHandler('qb-trucker:server:01101110', function(drops)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local drops = tonumber(drops)
    local bonus = 0
    local DropPrice = math.random(200, 200)
    if drops > 5 then 
        bonus = math.ceil((DropPrice / 10) * 5) + 100
    elseif drops > 10 then
        bonus = math.ceil((DropPrice / 10) * 7) + 300
    elseif drops > 15 then
        bonus = math.ceil((DropPrice / 10) * 10) + 400
    elseif drops > 20 then
        bonus = math.ceil((DropPrice / 10) * 12) + 500
    end
    local price = (DropPrice * drops) + bonus
    local taxAmount = math.ceil((price / 100) * PaymentTax)
    local payment = price - taxAmount
    Player.Functions.AddJobReputation(drops)
    Player.Functions.AddMoney("bank", payment, "trucker-salary")
    TriggerClientEvent('QBCore:Notify', src, 'Bạn đã kiếm được $'..payment, 'success')
end)

RegisterNetEvent('qb-trucker:server:nano')
AddEventHandler('qb-trucker:server:nano', function()
    local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))

	xPlayer.Functions.AddItem("thermite", 1, false)
    xPlayer.Functions.AddItem("mut", 1, false)
    xPlayer.Functions.AddItem("dauxanh", 1, false)
    xPlayer.Functions.AddItem("duong", 1, false)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["thermite"], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["mut"], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["dauxanh"], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["duong"], "add")
end)

RegisterNetEvent('qb-trucker:server:event')
AddEventHandler('qb-trucker:server:event', function()
    local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))

	xPlayer.Functions.AddItem("banhdauxanh", 1, false)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["banhdauxanh"], "add")
end)