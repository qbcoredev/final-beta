Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

local swiming = false
local time = 20
local done = false
Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(3)
		if IsPedSwimming(PlayerPedId()) then
			swiming = true
		elseif swiming then
			swiming = false
			done = false
			time = 20
		end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if swiming and time > 0 then
			local playerpos = GetEntityCoords(PlayerPedId())
			DrawText3D(playerpos.x, playerpos.y, playerpos.z, "~r~Các thiết bị điện tử của bạn sẽ bị hỏng do nước trong~w~"..time.."~r~ Giây~w~")
		elseif swiming and time >= -8 then
			local playerpos = GetEntityCoords(PlayerPedId())
			DrawText3D(playerpos.x, playerpos.y, playerpos.z, "~r~Các thiết bị điện tử của bạn bị hỏng~w~")
		end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(3)
		if swiming and not done then
			time = time - 1
			if time == 0 then
				TriggerServerEvent("qb-ruinedwater:Server:RemoveRadio")
				TriggerServerEvent("qb-ruinedwater:Server:RemovePhone")
			end
			Citizen.Wait(1000)
			if time == -9 then
				done = true
			end
		end
	end
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end