--TriggerEvent('es:addGroupCommand','tb','admin',function(source,args)
QBCore.Commands.Add("tb", "TB (God Only)", {{name="NOIDUNG", help="NOIDUNG"}}, true, function(source, args)
    Citizen.CreateThread(function()
        local str = ''
        local dem = 0
        for k,v in ipairs(args) do
           str = str .. v .. ' '
           dem = dem + 1
        end
        TriggerClientEvent('nui:on', -1, str)
        Citizen.Wait((dem+3)*2200)
        TriggerClientEvent('nui:off', -1)
      end)
end, "god")

RegisterServerEvent('esx_Tbao:thongbao')
AddEventHandler('esx_Tbao:thongbao',function(text)
  Citizen.CreateThread(function()
    local dem = _demtext(text)
    TriggerClientEvent('nui:on', -1, text)
    Citizen.Wait((dem+3)*2200)
    TriggerClientEvent('nui:off', -1)
  end)
end)

function _demtext(str)
  local dem = 0
  for i in string.gmatch(str, "%S+") do
    dem = dem + 1
  end
  return dem
end