local ELECTRIC_VEHICLES = {
 -- [GetHashKey('RMODM8C')] = true,
}

-- TODO: Replace with `FLAG_IS_ELECTRIC` from vehicles.meta:
-- https://gtamods.com/wiki/Vehicles.meta
function IsVehicleElectric(vehicle)
  local model = GetEntityModel(vehicle)
  return ELECTRIC_VEHICLES[model] or false
end
