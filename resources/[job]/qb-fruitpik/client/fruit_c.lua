local Keys = {
    ["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
QBCore = nil 

local PlayerData                = {}
local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local hasAlreadyEnteredMarkerr 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false
local isInJoblistingMarkerr 		 = false
local bet = 0
local wtrakcie = false
local model = "prop_bucket_02a"
local bagModel = "prop_bucket_02a"
local bagspawned = nil
local maitem = false
local tekst = 0
local stopControls = false
local showPro                 	= false
local boxowocow 				= nil
local owoce						= nil
local soki                      = nil
local dajdoAuta = true
local coordsVisible = false
------------------------------------------------CORE----------------------------

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
	
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
end)

--onload player
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerData = QBCore.Functions.GetPlayerData()
    end)
end)

--setjob
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)
--------------------------------------------------------------------------------
----TEXT 3D-------------------------------------------------------------------
function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 10)
end
---------------------------------------------END TEXT-----------------------------------------------------------------

---------------------------------------------text sulla mucca---------------------------------
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(10)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, 354.81, 6517.49, 28.24, true) < 20.0)  then
           
            DrawText3D2(354.81, 6517.49, 28.24, "~y~[E] ~b~Hái Cam")
           
            DrawText3D2(347.45, 6517.02, 28.79, "~y~[E] ~b~Hái Cam")
          
            DrawText3D2(339.54, 6516.92, 28.96, "~y~[E] ~b~Hái Cam")
         
        end
    end
end)
---------------------------------------------------------------------------------------------

-------------------------------------------------PRESSIONE E per raccogliere il latte---------
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(15)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if(GetDistanceBetweenCoords(coords, 354.81, 6517.49, 28.24, true) < 2.0) or (GetDistanceBetweenCoords(coords, 347.45, 6517.02, 28.79, true) < 2.0) or (GetDistanceBetweenCoords(coords, 339.54, 6516.92, 28.96, true) < 2.0) then
            local coords      = GetEntityCoords(GetPlayerPed(-1))
            local isInMarker  = false
            local currentZone = nil
            local zaplata = 0
            if IsControlJustReleased(0, Keys['E']) then
                if wtrakcie == false then
                    zbieranie()
                end
            end
        end 
    end 
end)
---------------------inizio la raccolta
function zbieranie()
    TriggerServerEvent('smerfikcraft:zlomiarzzbier2fp')
    wtrakcie = true
end

RegisterNetEvent('wiadro:postawfp')
AddEventHandler('wiadro:postawfp', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)
    if maitem == false then
        QBCore.Functions.SpawnObject(model, {
            x = x,
            y = y,
            z = z
        }, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
            Citizen.Wait(15000)
            DeleteObject(obj)
        end)
    end
end)

RegisterNetEvent('smerfik:zamrozcrft222fp')
AddEventHandler('smerfik:zamrozcrft222fp', function()
    playerPed = PlayerPedId()
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(playerPed, true)
end)

RegisterNetEvent('smerfik:odmrozcrft222fp')
AddEventHandler('smerfik:odmrozcrft222fp', function()
    playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(PlayerPedId())
    TriggerEvent('podlacz:propa22fp')
    maitem = true
    Citizen.Wait(500)
    wtrakcie = false
end)
--------------richiamo animazione--------------------------------------------------
RegisterNetEvent('smerfik:craftanimacja222fp')
AddEventHandler('smerfik:craftanimacja222fp', function()
   
    --TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    animacjazbierania()
    Citizen.Wait(2000)
end)
-------------------------------------------------------------------------------------

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end


--------------------------------------------------fine creazione oggetto------------------------------------

Citizen.CreateThread(function()
    while true do
        Wait(5)
        local coords  = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, 404.08, 6526.95, 27.71, true) < 5.0) then
            local coords      = GetEntityCoords(PlayerPedId())
            local zaplata = 0
            local hasBagd = false
            local s1d = false
            local hasBagdfb = false
		    local s1dfb = false
			if(GetDistanceBetweenCoords(coords, 404.08, 6526.95, 27.71, true) < 3.0) then
				DrawText3D2(404.08, 6526.95, 27.71, '~y~[E] ~b~Chế Nước Cam')
				DrawMarker(27, 404.08, 6526.95, 27.71-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
								
                if IsControlJustReleased(0, Keys['E']) and not isProcessing then
                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                        hasBagd = result
                        s1d = true
                end, 'orange')
                while(not s1d) do
                        Citizen.Wait(100)
                    end
                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                            hasBagdfb = result
                            s1dfb = true
                    end, 'emptybottle')
                    while(not s1dfb) do
                        Citizen.Wait(100)
                    end
                if (hasBagd and hasBagdfb) then
                    if stopControls == false then
                        skup()
                    end
                else
                    QBCore.Functions.Notify('Bạn Không Có Hộp Giấy ...', 'error')
                end
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------

------------------------------------------------selllll-juice-orange-------------------------------------------------------

local sellX = 410.13
local sellY = 6454.67
local sellZ = 28.81
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(7)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellX, sellY, sellZ)
	
	if dist <= 20.0 then
	DrawMarker(27, sellX, sellY, sellZ-0.96, 0, 0, 0, 0, 0, 0, 2.20, 2.20, 2.20, 255, 255, 255, 200, 0, 0, 0, 0)
	else
	Citizen.Wait(1000)
	end
	local hasBagd7 = false
	local s1d7 = false
	if dist <= 2.0 then
	DrawText3D2(sellX, sellY, sellZ+0.1, "~y~[E] ~b~Bán Nước Cam")
		if IsControlJustPressed(0, Keys['E']) then 
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasBagd7 = result
					s1d7 = true
			end, 'orangejuice')
			while(not s1d7) do
					Citizen.Wait(100)
				end
			if (hasBagd7) then
		SellKurczaki2()
		else
		QBCore.Functions.Notify('Bạn Không Có Nước Cam .', 'error')
		end
		end	
	end
	
end
end)


function SellKurczaki2()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Đang Bán..", 5000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
    prop = CreateObject(GetHashKey('beerrow_local'), x, y, z,  true,  true, true)
    
    SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
    
    
    
    LoadDict2('amb@medic@standing@tendtodead@idle_a')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    Citizen.Wait(5000)
    LoadDict2('amb@medic@standing@tendtodead@exit')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    ClearPedTasks(GetPlayerPed(-1))
    DeleteEntity(prop)
   
    TriggerServerEvent('milk:sellfp')
    --TriggerServerEvent("tostKurczaki:przerob",3)
    else
    
    
    end
end
------------------------------------------------fine vendita----------------------------------------------

------------------------------------------------selllll-orange--------------------------------------------------------

local sellXa = 417.86
local sellYa = 6519.82
local sellZa = 27.71
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(7)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellXa, sellYa, sellZa)
	
	if dist <= 20.0 then
	DrawMarker(27, sellXa, sellYa, sellZa-0.96, 0, 0, 0, 0, 0, 0, 2.20, 2.20, 2.20, 255, 255, 255, 200, 0, 0, 0, 0)
	else
	Citizen.Wait(1000)
	end
	local hasBagd7 = false
	local s1d7 = false
	if dist <= 2.0 then
	DrawText3D2(sellXa, sellYa, sellZa+0.1, "~y~[E] ~b~Sell orange3")
		if IsControlJustPressed(0, Keys['E']) then 
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasBagd7 = result
					s1d7 = true
			end, 'orange')
			while(not s1d7) do
					Citizen.Wait(100)
				end
			if (hasBagd7) then
                SellKurczaki2ora()
		else
		QBCore.Functions.Notify('You have no orange .', 'error')
		end
		end	
	end
	
end
end)


function SellKurczaki2ora()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Selling..", 5000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
    prop = CreateObject(GetHashKey('apa_mp_h_acc_fruitbowl_01'), x, y, z,  true,  true, true)
    
    SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
    
    
    
    LoadDict2('amb@medic@standing@tendtodead@idle_a')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    Citizen.Wait(5000)
    LoadDict2('amb@medic@standing@tendtodead@exit')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    ClearPedTasks(GetPlayerPed(-1))
    DeleteEntity(prop)
   
    TriggerServerEvent('milk:sellfpor')
    
    else
    
    
    end
end
------------------------------------------------fine vendita----------------------------------------------




-------------------------------------------animazione-----------------------------------------------------
function LoadDict2(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end


----------------------------------------------CREO IL SECCHIO E LO TRASPORTO------------------------------
RegisterNetEvent('podlacz:propa22fp')
AddEventHandler('podlacz:propa22fp', function()
   
   local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()
   

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunpropboxowocowx()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			boxowocow = CreateObject(GetHashKey("prop_crate_float_1"), 0, 0, 0, true, true, false) -- creates object
			owoce = CreateObject(GetHashKey("apa_mp_h_acc_fruitbowl_01"), 0, 0, 0, true, true, false) -- creates object
			AttachEntityToEntity(boxowocow, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, -0.4, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			AttachEntityToEntity(owoce, boxowocow, GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.1, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
            TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
            QBCore.Functions.Notify('đem cam lại gần xe .', 'success', 7000)
		end
	end

    Citizen.Wait(10000)
end)

--- elimino il prop
function usunpropboxowocowx()
    DeleteEntity(boxowocow)
    DeleteEntity(owoce)
    DeleteEntity(soki)
    DetachEntity(boxowocow, 1, 1)
    
    DetachEntity(owoce, 1, 1)
end
-------------------animazione prendo dall'albero

------------------------------------------carico in macchina----------------------
RegisterNetEvent('smerfik:reset')
AddEventHandler('smerfik:reset', function()
	coordsVisible=true
end)

function animacjazbierania()
	local ad = "amb@prop_human_movie_bulb@base"
	local anim = "base"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
		end
    end
    
end


Citizen.CreateThread(function()
    
while true do
    Citizen.Wait(250)
    if coordsVisible then
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(ped)
        local veh = GetClosestVehicle(coords.x, coords.y, coords.z, 3.000, 0, 70)
        local vCoords = GetEntityCoords(veh)
        local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, vCoords.x, vCoords.y, vCoords.z, false)
        LoadDict2('anim@heists@box_carry@')
    
        if not IsEntityPlayingAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 3 ) and dajdoAuta == true then
        TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@box_carry@', "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        end
        
        if veh and (dist < 3.0) then
            coordsVisible = false
    
        QBCore.Functions.Notify('thành công', 'success') --success
        LoadDict2('anim@heists@narcotics@trash')
        TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@narcotics@trash', "throw_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        Citizen.Wait(900)
        ClearPedTasks(GetPlayerPed(-1))
        DeleteEntity(boxowocow)
        DeleteEntity(owoce)
        DeleteEntity(soki)
        DetachEntity(boxowocow, 1, 1)
        
        DetachEntity(owoce, 1, 1)
        
        TriggerServerEvent("tost:addfruit")
         end
        end 
end
end)

RegisterNetEvent('sprzedawanie:jablekanim22fp')
AddEventHandler('sprzedawanie:jablekanim22fp', function()
	local playerPed = PlayerPedId()
	local lib, anim = 'mini@repair', 'fixing_a_ped'
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(500)
	RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	end)
end)
---------------------------------------------------------processo-----------------------------
RegisterNetEvent('tp:milkingfp')
AddEventHandler('tp:milkingfp', function(source)
	 SellKurczaki2fb()         
end)
function SellKurczaki2fb()
    isProcessing = true
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Đang Làm..", 5000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
    prop8 = CreateObject(GetHashKey('apa_mp_h_acc_fruitbowl_01'), x, y, z,  true,  true, true)
    
    SetEntityHeading(prop8, GetEntityHeading(GetPlayerPed(-1)))
    
    
    
    LoadDict2('amb@medic@standing@tendtodead@idle_a')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    Citizen.Wait(5000)
    LoadDict2('amb@medic@standing@tendtodead@exit')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    ClearPedTasks(GetPlayerPed(-1))
    DeleteEntity(prop8)
   
    ClearPedTasksImmediately(PlayerPedId())
    
    else
    
    
    end
    isProcessing = false
end


---------------------------------fine processo

RegisterNetEvent('tp:misc-jobs:unlockControlsfp')
AddEventHandler('tp:misc-jobs:unlockControlsfp', function(source)
    print("unlocking controls")
    stopControls = false
end)

function skup()
    stopControls = true
    TriggerServerEvent('smerfikcraft:skup22fp')
	FreezeEntityPosition(PlayerPedId(), false)
	wtrakcie = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if stopControls == true then
            DisableControlAction(0, Keys['E'], true)
        end
    end
end)

RegisterNetEvent('odlacz:propa3fp')
AddEventHandler('odlacz:propa3fp', function()
    DetachEntity(boxowocow, 1, 1)
    
    DetachEntity(owoce, 1, 1)
    DeleteObject(boxowocow)
  
    DeleteEntity(owoce)
    ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent('odlacz:propa2fp')
AddEventHandler('odlacz:propa2fp', function()
    DeleteObject(boxowocow)
  
    DeleteEntity(owoce)
    maitem = false
    FreezeEntityPosition(PlayerPedId(), false)
    stopControls = false
end)

--------------------------------------------------------blip
 local blips = {
    {title="~o~[Hái Cam]~s~Vườn Cam", colour=47, id=467, x = 354.81, y = 6517.49, z = 28.24},
    {title="~o~[Hái Cam]~s~Vườn Cam", colour=47, id=467, x = 347.45, y = 6517.02, z = 28.79},
    {title="~o~[Hái Cam]~s~Vườn Cam", colour=47, id=467, x = 339.54, y = 6516.92, z = 28.96},
    {title="~o~[Hái Cam]~s~Vắt Nước Cam", colour=47, id=467, x = 404.26, y = 6526.37, z = 27.7},
    {title="~o~[Hái Cam]~s~Bán Cam", colour=47, id=467, x = 417.86, y = 6519.82, z = 27.71},
    {title="~o~[Hái Cam]~s~Bán Nước Cam", colour=47, id=467, x = 409.59, y =6453.49, z = 28.81}
}



Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.8)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end) 
-------------------------------------------------end blip

local UI = {
    x =  0.000 ,	-- Base Screen Coords 	+ 	 x
    y = -0.001 ,	-- Base Screen Coords 	+ 	-y
}

RegisterNetEvent('smerfik:tekstjab22fp')
AddEventHandler('smerfik:tekstjab22fp', function()
    while true do
        Citizen.Wait(1)
        if wtrakcie == true then
            drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~y~[~w~".. tekst .. "%~y~]", 255, 255, 255, 255)
        end
    end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('smerfik:zdejmijznaczek22fp')
AddEventHandler('smerfik:zdejmijznaczek22fp', function()
    wtrakcie = false
end)

RegisterNetEvent('zacznijtekst22fp')
AddEventHandler('zacznijtekst22fp', function()
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(1500)
    tekst = 0
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

