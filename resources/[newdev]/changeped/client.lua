RegisterCommand('ped', function(source, args)
    if not args[1] then
        print("lol")
    else
        local pedModel = args[1]
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            RequestModel(pedModel)
            Citizen.Wait(1)
        end
        SetPlayerModel(PlayerId(), pedModel)
    end
end, false)
