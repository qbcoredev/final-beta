RegisterServerEvent('qb-daoda:getItem')
AddEventHandler('qb-daoda:getItem', function()
    local xPlayer, randomItem = QBCore.Functions.GetPlayer(source), Config.Items[math.random(1, #Config.Items)]
    if math.random(0, 100) <= Config.ChanceToGetItem then
        xPlayer.Functions.AddItem(randomItem, 1)
        TriggerClientEvent("QBCore:Notify", source, "Bạn Đã Đào Được Gì Đó", "success", 10000)
    end
end)

RegisterServerEvent('qb-daoda:sell')
AddEventHandler('qb-daoda:sell', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local Player = QBCore.Functions.GetPlayer(src)

    if xPlayer.Functions.RemoveItem("steel", 1) then
        TriggerClientEvent("QBCore:Notify", src, "Bạn Đã Bán 1 Thép", "success", 1000)
        Player.Functions.AddMoney("cash", Config.price.steel)
        Citizen.Wait(200)
    else
        TriggerClientEvent("QBCore:Notify", src, "Bạn không có vật phẩm khai thác để bán", "error", 1000)
    end--[[ 
        Citizen.Wait(1000)
    if xPlayer.Functions.RemoveItem("iron", 1) then
        TriggerClientEvent("QBCore:Notify", src, "Bạn đã bán 1 sắt", "success", 1000)
        Player.Functions.AddMoney("cash", Config.price.iron)
        Citizen.Wait(200)
    else
        TriggerClientEvent("QBCore:Notify", src, "Bạn không có vật phẩm khai thác để bán", "error", 1000)
    end
        Citizen.Wait(1000)
    if xPlayer.Functions.RemoveItem("copper", 1) then
        TriggerClientEvent("QBCore:Notify", src, "Bạn đã bán 1 đồng", "success", 1000)
        Player.Functions.AddMoney("cash", Config.price.copper)
        Citizen.Wait(200)
    else
        TriggerClientEvent("QBCore:Notify", src, "Bạn không có vật phẩm khai thác để bán", "error", 1000)
    end ]]
end)
