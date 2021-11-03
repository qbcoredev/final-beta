QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)



QBCore.Functions.CreateCallback('pazzodoktor:doktorsOnline', function(source, cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local xPlayers = QBCore.Functions.GetPlayers()
	local medicsOnline = 0
	local bankBalance = xPlayer.PlayerData.money["bank"]
	local moneyBalance = xPlayer.PlayerData.money["cash"]
	local enoughMoney = false
	
	if bankBalance >= Config.Price then
		enoughMoney = true
	elseif moneyBalance >= Config.Price then
		enoughMoney = true
	else
		TriggerClientEvent('QBCore:Notify', src, "Bạn Không Đủ Tiền..", "error")
	end

--[[ 	for i=1, #xPlayers, 1 do
		local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
		if xPlayer.PlayerData.job == 'ambulance' and xPlayer.PlayerData.job.onduty then
			medicsOnline = medicsOnline + 1
		end
	end ]]
	for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local xPlayer = QBCore.Functions.GetPlayer(v)
        if xPlayer ~= nil then
            if xPlayer.PlayerData.job.name == "ambulance" and xPlayer.PlayerData.job.onduty then
                medicsOnline = medicsOnline + 1
            end
        end
    end

	cb(medicsOnline, enoughMoney)
end)

RegisterServerEvent('pazzodoktor:odeme')
AddEventHandler('pazzodoktor:odeme', function()
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local bankBalance = xPlayer.PlayerData.money["bank"]
	local moneyBalance = xPlayer.PlayerData.money["cash"]
	
	if moneyBalance >= Config.Price then
		xPlayer.Functions.RemoveMoney("cash", Config.Price)
		TriggerEvent("qb-bossmenu:server:addAccountMoney", "ambulance", Config.Price * 0.30)
	elseif bankBalance >= Config.Price then
		xPlayer.Functions.RemoveMoney("bank", Config.Price)
		TriggerEvent("qb-bossmenu:server:addAccountMoney", "ambulance", Config.Price * 0.30)
	end
end)
