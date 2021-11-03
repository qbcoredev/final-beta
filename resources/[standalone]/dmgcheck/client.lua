QBCore = nil
local isArmoured = false
local curAr = 0
local loadout = {}


Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(0)
    end
	Citizen.Wait(10000)
    local healtTable = {}
    while true do
        Citizen.Wait(0)
		SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
		SetPlayerMeleeWeaponDamageModifier(PlayerId(), 1.0)
        local aiming, targetAiming = GetEntityPlayerIsFreeAimingAt(PlayerId())
        if aiming and DoesEntityExist(targetAiming) and not IsPedAPlayer(targetAiming) then
            if IsControlJustReleased(0, 48) then -----Z
                print('debug model: ' .. GetEntityModel(targetAiming) .. ' | dist: ' .. Vdist(GetEntityCoords(PlayerPedId()), GetEntityCoords(targetAiming)) .. ' | owner: ' .. GetPlayerName(NetworkGetEntityOwner(targetAiming)) .. " | isOwned: "..IsVehiclePreviouslyOwnedByPlayer(targetAiming))
            end
        end
    end
end)