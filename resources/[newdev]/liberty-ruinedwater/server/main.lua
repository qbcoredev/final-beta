RegisterServerEvent("qb-ruinedwater:Server:RemoveRadio")
AddEventHandler("qb-ruinedwater:Server:RemoveRadio", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "radio" then 
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
    end
end)

RegisterServerEvent("qb-ruinedwater:Server:RemovePhone")
AddEventHandler("qb-ruinedwater:Server:RemovePhone", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "phone" then 
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
    end
end)