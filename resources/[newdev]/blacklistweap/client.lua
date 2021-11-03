CreateThread(function()
    local sleep = 100
	while true do
        Wait(sleep)
        local playerPed = PlayerPedId()
        local nothing, weapon = GetCurrentPedWeapon(playerPed, true)
        local blacklisted, name = isWeaponBlacklisted(weapon)
		local PlayerJob = QBCore.Functions.GetPlayerData().job
		if blacklisted then
			if PlayerJob.name == "police" and PlayerJob.onduty then
			--	print(PlayerJob.name, PlayerJob.onduty)
			else
			    RemoveWeaponFromPed(playerPed, weapon)
			--	print(PlayerJob.name, PlayerJob.onduty)
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(Config.BlacklistedWeapons) do
		if model == GetHashKey(blacklistedWeapon) then
			return true, blacklistedWeapon
		end
	end
	return false, nil
end
