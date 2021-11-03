local speakers = {}

local coords = {}
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateUseableItem("boombox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('boombox:place', source)
end)

RegisterServerEvent('boombox:loadSpeaker')
AddEventHandler('boombox:loadSpeaker', function(speaker)
    speakers[speaker.speaker] = speaker
    speakers[speaker.speaker].switch = false
    speakers[speaker.speaker].volchange = false
    speakers[speaker.speaker].volval = 100
    speaker.switch = false
    speaker.volchange = false
    speaker.volval = 100
    TriggerClientEvent('boombox:loadSpeakerClient', -1, speaker)
end)

local id = 0

RegisterServerEvent('boombox:removeSpeaker')
AddEventHandler('boombox:removeSpeaker', function(speaker)
    id = id - 1
    TriggerClientEvent("boombox:removeClient", -1, speaker)
end)


RegisterServerEvent('boombox:placedSpeaker')
AddEventHandler('boombox:placedSpeaker', function(spawncoords, speakerid)
    id = id + 1
    local speaker = {}
    speaker.speakerid = speakerid
    speaker.coords = spawncoords
    speaker.speaker = id
    table.insert(speakers, speaker)
    TriggerClientEvent('boombox:loadSpeakerClient', -1, speaker)
end)

RegisterServerEvent('boombox:joined')
AddEventHandler('boombox:joined', function()
    local src = source
    for i=1, #speakers do
        --print(speakers[i].coords)
        --print(speakers[i].speaker)
        --print(speakers[i].volchange)
        --print(speakers[i].videoStatus)
        --print(speakers[i].time)
    end
    TriggerClientEvent("boombox:joined", src, speakers)
end)



RegisterServerEvent('boombox:switchVideo')
AddEventHandler('boombox:switchVideo', function(id, videoStatus, time)
    local src = source
    TriggerClientEvent("boombox:switchVideoClient", -1, id, videoStatus, time)
    speakers[id].switch = true
    speakers[id].videoStatus = videoStatus
    speakers[id].time = time - speakers[id].time
end)



RegisterServerEvent('boombox:changeVol')
AddEventHandler('boombox:changeVol', function(id, vol)
    local src = source
    speakers[id].volval = vol
    TriggerClientEvent("boombox:changeVolClient", -1, id, vol)
end)