--------------------Contact For Buy - DISCORD : QBCore#9852------------------------------
--------------######WOODCUTTER########----------------------
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


-------------------------------------------------CREO IL SECCHIO E IL LATTE----------------------------------------
RegisterServerEvent('smerfikcraft:zlomiarzzbier2fp')
AddEventHandler('smerfikcraft:zlomiarzzbier2fp', function()
   
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName('orange')

    if Item == nil then
  
       -- TriggerClientEvent('wiadro:postaw', _source)
        TriggerClientEvent('smerfik:zamrozcrft222fp', _source)
        TriggerClientEvent('zacznijtekst22fp', _source)
        TriggerClientEvent('smerfik:craftanimacja222fp', _source)
        TriggerClientEvent('smerfik:tekstjab22fp', _source)
        Citizen.Wait(10000)
        ---------------------------------------
        --local ilosc = math.random(10,10)
       -- xPlayer.Functions.AddItem('milk', ilosc)
        -----------------------------------------

		--TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['milk'], "add")
        TriggerClientEvent('smerfik:odmrozcrft222fp', _source)
        --TriggerClientEvent("QBCore:Notify", _source, 'Collected'.. ilosc .. ' milk', "success", 7000)
        TriggerClientEvent('smerfik:reset', _source)
   else
        if Item.amount < 50 then
        --  TriggerClientEvent('wiadro:postaw', _source)
          TriggerClientEvent('smerfik:zamrozcrft222fp', _source)
          TriggerClientEvent('zacznijtekst22fp', _source)
          TriggerClientEvent('smerfik:craftanimacja222fp', _source)
          TriggerClientEvent('smerfik:tekstjab22fp', _source)
          Citizen.Wait(10000)
          ----------------------------------------
         -- local ilosc = math.random(10,10)
         -- xPlayer.Functions.AddItem('milk', ilosc)
          ----------------------------------------

		  --TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['milk'], "add")
          TriggerClientEvent('smerfik:odmrozcrft222fp', _source)
          -- TriggerClientEvent("QBCore:Notify", _source, 'Collected'.. ilosc .. ' milk', "success", 7000)
          TriggerClientEvent('smerfik:reset', _source)
        else 

        TriggerClientEvent('smerfik:zdejmijznaczek22fp', _source)
        TriggerClientEvent("QBCore:Notify", _source, 'You dont have orange!', "error", 7000)
       
         end

    end

end)
--------------------------------------------------------------------------

-----ad fruit-----------------
RegisterServerEvent('tost:addfruit')
AddEventHandler('tost:addfruit', function()

    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName('orange')

    if Item == nil then
  
       -- TriggerClientEvent('wiadro:postaw', _source)
       
        ---------------------------------------
        local ilosc = math.random(1,3)
        xPlayer.Functions.AddItem('orange', ilosc)
        -----------------------------------------
        TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['orange'], "add")
		
   else
        if Item.amount < 50 then
        
          ----------------------------------------
          local ilosc = math.random(1,3)
          xPlayer.Functions.AddItem('orange', ilosc)
          ----------------------------------------

		  TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['orange'], "add")
          
        else 

        TriggerClientEvent('smerfik:zdejmijznaczek22fp', _source)
        TriggerClientEvent("QBCore:Notify", _source, 'You dont have room for more orange!', "error", 7000)
       
         end

    end

end)

------------------------------------NOT USE
RegisterServerEvent('smerfikcraft:skup22fp')
AddEventHandler('smerfikcraft:skup22fp', function()
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName('orange')
    if Item == nil then
        TriggerClientEvent('QBCore:Notify', source, 'Không Có Cam', "error")  
    else
        if Item.amount >= 1 then
        TriggerClientEvent('tp:milkingfp', _source)
        TriggerClientEvent('odlacz:propa3fp', _source)
        xPlayer.Functions.RemoveItem('orange', 1)----change this emptybottle
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orange'], "remove")
        xPlayer.Functions.RemoveItem('emptybottle', 1)----change this emptybottle
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['emptybottle'], "remove")
        TriggerClientEvent('sprzedawanie:jablekanim22fp', _source)
       xPlayer.Functions.AddItem('orangejuice', 1)
	   TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orangejuice'], "add")
        TriggerClientEvent('odlacz:propa2fp', _source)
        TriggerClientEvent('tp:misc-jobs:unlockControlsfp', _source)
        else
            TriggerClientEvent('QBCore:Notify', _source, 'Bạn Không Đủ Hộp Giấy', "success")  
            TriggerClientEvent('tp:misc-jobs:unlockControlsfp', _source)
        end
     end
end)

--------------sell juice orange
RegisterServerEvent('milk:sellfp')
AddEventHandler('milk:sellfp', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local Item = xPlayer.Functions.GetItemByName('orangejuice')
	if Item == nil then
       TriggerClientEvent('QBCore:Notify', source, 'Không Có Nước Cam', "error")  
	else
		if Item.amount > 0 then
            local reward = 0
            reward = reward + math.random(30, 50)
			xPlayer.Functions.RemoveItem('orangejuice', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orangejuice'], "remove")
			xPlayer.Functions.AddMoney("cash", reward, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', source, 'Bạn Đã Bán Nước Cam', "success")  
        end   
	end
end)

--------------sell orange 
RegisterServerEvent('milk:sellfpor')
AddEventHandler('milk:sellfpor', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local Item = xPlayer.Functions.GetItemByName('orange')
	if Item == nil then
       TriggerClientEvent('QBCore:Notify', source, 'No orange', "error")  
	else
		if Item.amount > 0 then
            local reward = 0
            reward = reward + math.random(10, 17)
			xPlayer.Functions.RemoveItem('orange', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['orange'], "remove")
			xPlayer.Functions.AddMoney("cash", reward, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', source, 'you sold orange', "success")  
        end 
	end
end)