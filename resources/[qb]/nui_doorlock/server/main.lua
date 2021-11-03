QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('nui_doorlock:server:updateState')
AddEventHandler('nui_doorlock:server:updateState', function(doorID, locked, src, usedLockpick, isScript)
    local playerId = source
    local xPlayer = QBCore.Functions.GetPlayer(playerId)

    if type(doorID) ~= 'number' then
        print(('nui_doorlock: %s (%s) didn\'t send a number! (Sent %s)'):format(xPlayer.PlayerData.name, xPlayer.PlayerData.license, doorID))
        return
    end

    if type(locked) ~= 'boolean' then
        print(('nui_doorlock: %s (%s) attempted to update invalid state! (Sent %s)'):format(xPlayer.PlayerData.name, xPlayer.PlayerData.license, locked))
        return
    end

    if not Config.DoorList[doorID] then
        print(('nui_doorlock: %s (%s) attempted to update invalid door! (Sent %s)'):format(xPlayer.PlayerData.name, xPlayer.PlayerData.license, doorID))
        return
    end
    
    if not IsAuthorized(xPlayer, Config.DoorList[doorID], usedLockpick, isScript) then
        return
    end

    Config.DoorList[doorID].locked = locked
    if not src then TriggerClientEvent('nui_doorlock:setState', -1, playerId, doorID, locked, false, isScript)
    else TriggerClientEvent('nui_doorlock:setState', -1, playerId, doorID, locked, src, isScript) end

    if Config.DoorList[doorID].autoLock then
        SetTimeout(Config.DoorList[doorID].autoLock, function()
            if Config.DoorList[doorID].locked == true then return end
            Config.DoorList[doorID].locked = true
            TriggerClientEvent('nui_doorlock:setState', -1, -1, doorID, true, isScript)
        end)
    end
end)

QBCore.Functions.CreateCallback('nui_doorlock:getDoorList', function(source, cb)
    cb(Config.DoorList)
end)

function IsAuthorized(xPlayer, doorID, usedLockpick, isScript)
    if isScript then return true end
    local jobName, grade = xPlayer.PlayerData.job.name, xPlayer.PlayerData.job.grade.level
    
    if doorID.lockpick and usedLockpick then
        return true
    end

    if doorID.authorizedJobs then
        for job,rank in pairs(doorID.authorizedJobs) do
            if (job == jobName and rank <= grade) then
                return true
            end
        end
    end

    if doorID.items then
        for k, v in pairs(doorID.items) do
            local item = xPlayer.Functions.GetItemByName(v)
            if item ~= nil and item.amount > 0 then
                local consumables = {'ticket'} -- Add items you would like to be removed after use to this table
                if doorID.locked and consumables[v] then
                    xPlayer.Functions.RemoveItem(v, 1)
                end
                return true
            end
        end
    end

    if Config.AdminAccess and QBCore.Functions.HasPermission(xPlayer.PlayerData.source, 'admin') then
        print(xPlayer.PlayerData.name..' opened a door using admin privileges')
        return true
    end
    return false
end

QBCore.Functions.CreateCallback('nui_doorlock:CheckItems', function(source, cb, items, locked)
	local Player = QBCore.Functions.GetPlayer(source)

	if Player ~= nil then
		local canOpen = false
		local count = false
		for k,v in pairs(items) do
			if Player.Functions.GetItemByName(v) ~= nil then
				count = true
			else
				count = false
			end
			if count then
				canOpen = true
				local consumables = { ['ticket']=1 }
				if locked and consumables[v] then
					Player.Functions.RemoveItem(v, 1)
				end
				break

			end
		end
		if not count then canOpen = false end
		cb(canOpen)
	else
		cb(false)
	end
end)

QBCore.Commands.Add('newdoor', 'Create a new door using a gun', {{name='doortype', help='door/double/sliding/garage/doublesliding'},{name='locked', help='true/false'},{name='jobs', help='Add up to 4 jobs to this, seperate with spaces and no commas'}}, false, function(source, args)
    TriggerClientEvent('nui_doorlock:newDoorSetup', source, args)
end, 'god')

RegisterServerEvent('nui_doorlock:newDoorCreate')
AddEventHandler('nui_doorlock:newDoorCreate', function(config, model, heading, coords, jobs, item, doorLocked, maxDistance, slides, garage, doubleDoor, doorname)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not QBCore.Functions.HasPermission(source, 'god') then print(xPlayer.PlayerData.name.. 'attempted to create a new door but does not have permission') return end
    doorLocked = tostring(doorLocked)
    slides = tostring(slides)
    garage = tostring(garage)
    local newDoor = {}
    if jobs[1] then auth = tostring("['"..jobs[1].."']=0") end
    if jobs[2] then auth = auth..', '..tostring("['"..jobs[2].."']=0") end
    if jobs[3] then auth = auth..', '..tostring("['"..jobs[3].."']=0") end
    if jobs[4] then auth = auth..', '..tostring("['"..jobs[4].."']=0") end

    if auth then newDoor.authorizedJobs = { auth } end
    if item then newDoor.items = { item } end
    newDoor.locked = doorLocked
    newDoor.maxDistance = maxDistance
    newDoor.slides = slides
    if not doubleDoor then
        newDoor.garage = garage
        newDoor.objHash = model
        newDoor.objHeading = heading
        newDoor.objCoords = coords
        newDoor.fixText = false
    else
        newDoor.doors = {
            {objHash = model[1], objHeading = heading[1], objCoords = coords[1]},
            {objHash = model[2], objHeading = heading[2], objCoords = coords[2]}
        }
    end
        newDoor.audioRemote = false
        newDoor.lockpick = false
    local path = GetResourcePath(GetCurrentResourceName())
    
    if config ~= '' then
        path = path:gsub('//', '/')..'/configs/'..string.gsub(config, ".lua", "")..'.lua'
    else
        path = path:gsub('//', '/')..'/config.lua'
    end


    file = io.open(path, 'a+')
    if not doorname then label = '\n\n-- UNNAMED DOOR CREATED BY '..xPlayer.PlayerData.name..'\ntable.insert(Config.DoorList, {'
    else
        label = '\n\n-- '..doorname.. '\ntable.insert(Config.DoorList, {'
    end
    file:write(label)
    for k,v in pairs(newDoor) do
        if k == 'authorizedJobs' then
            local str =  ('\n	%s = { %s },'):format(k, auth)
            file:write(str)
        elseif k == 'doors' then
            local doorStr = {}
            for i=1, 2 do
                table.insert(doorStr, ('	{objHash = %s, objHeading = %s, objCoords = %s}'):format(model[i], heading[i], coords[i]))
            end
            local str = ('\n	%s = {\n	%s,\n	%s\n },'):format(k, doorStr[1], doorStr[2])
            file:write(str)
        elseif k == 'items' then
            local str = ('\n	%s = { \'%s\' },'):format(k, item)
            file:write(str)
        else
            local str = ('\n	%s = %s,'):format(k, v)
            file:write(str)
        end
    end
    file:write([[
        
    -- oldMethod = true,
    -- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
    -- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
    -- autoLock = 1000]])
    file:write('\n})')
    file:close()
    local doorID = #Config.DoorList + 1
    
    if jobs[4] then newDoor.authorizedJobs = { [jobs[1]] = 0, [jobs[2]] = 0, [jobs[3]] = 0, [jobs[4]] = 0 }
    elseif jobs[3] then newDoor.authorizedJobs = { [jobs[1]] = 0, [jobs[2]] = 0, [jobs[3]] = 0 }
    elseif jobs[2] then newDoor.authorizedJobs = { [jobs[1]] = 0, [jobs[2]] = 0 }
    elseif jobs[1] then newDoor.authorizedJobs = { [jobs[1]] = 0 } end
    if item then newDoor.Items = { item } end

    Config.DoorList[doorID] = newDoor
    Config.DoorList[doorID].locked = doorLocked 
    TriggerClientEvent('nui_doorlock:newDoorAdded', -1, newDoor, doorID, doorLocked)
end)
