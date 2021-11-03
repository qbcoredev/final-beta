-- facut de Uwu Hentai | Muie copiatorilor
local zone = {
	["prison"] = {x=1759.64,y=2488.46,z=45.84,radius = 25.0},  -- vector4(1759.64, 2488.46, 45.84, 108.85)
}

local uwuMUIEeulamfacut = {laba = false,x=nil,y=nil,z=nil,radius=nil}

function coliziune(entitate)
	for _, lr in ipairs(GetActivePlayers()) do
		if(Vdist(GetEntityCoords(GetPlayerPed(lr)),uwuMUIEeulamfacut.x,uwuMUIEeulamfacut.y,uwuMUIEeulamfacut.z) <= uwuMUIEeulamfacut.radius) then
			SetEntityNoCollisionEntity(GetPlayerPed(lr),entitate,true)
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local jucatorimuie = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(jucatorimuie, true))
		
		if(uwuMUIEeulamfacut.laba == false) then
			for i,v in pairs(zone) do
				if(Vdist(x,y,z,v.x,v.y,v.z) <= v.radius) then
					uwuMUIEeulamfacut.laba = true
					uwuMUIEeulamfacut.x,uwuMUIEeulamfacut.y,uwuMUIEeulamfacut.z,uwuMUIEeulamfacut.radius = v.x,v.y,v.z,v.radius
					SetCurrentPedWeapon(jucatorimuie,GetHashKey("WEAPON_UNARMED"),true)
					ClearPlayerWantedLevel(PlayerId())
					SetPlayerInvincible(jucatorimuie,true)
					SetEntityAlpha(PlayerPedId(), 170, false)
				end
			end
		end
		if uwuMUIEeulamfacut.laba then
			NetworkSetFriendlyFireOption(false)
			DisableControlAction(2, 37, true)
			DisablePlayerFiring(jucatorimuie,true)
			DisableControlAction(0, 106, true)
			Draw3DText(x,y,z, "[~g~Khu Vực An Toàn~w~]", 0.7)

			coliziune(player)
			if(Vdist(x,y,z,uwuMUIEeulamfacut.x,uwuMUIEeulamfacut.y,uwuMUIEeulamfacut.z) > 50.0) then
				uwuMUIEeulamfacut.laba = false
				uwuMUIEeulamfacut.x,uwuMUIEeulamfacut.y,uwuMUIEeulamfacut.z,uwuMUIEeulamfacut.radius = nil,nil,nil,nil
				NetworkSetFriendlyFireOption(true)
				DisableControlAction(2, 37, false)
				DisablePlayerFiring(jucatorimuie,false)
				DisableControlAction(0, 106, false)
				SetPlayerInvincible(jucatorimuie,false)
				SetEntityAlpha(PlayerPedId(), 255, false)
			end
		end
	end
end)

function drawtxt(text,font,centre,x,y,scale,r,g,b,a)
    y = y - 0.010
    scale = scale/2
    y = y + 0.002
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextFont(fontId)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end


function Draw3DText(x,y,z, text,scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString("~h~"..text)
        DrawText(_x,_y)
    end
end