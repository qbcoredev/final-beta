Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 2
}

Config.Pricesell = 250

Config.MinPiecesWed = 1

--[[ Config.DrugDealerItems = {
	empty_weed_bag = 91
} ]]

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. 

Config.GiveBlack = false -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	WeedField = {coords = vector3(4816.96, -5792.05, 37.08), name = 'blip_weedfield', color = 25, sprite = 496, radius = 100.0},
	WeedProcessing = {coords = vector3(1391.94, 3605.96, 38.94), name = 'blip_weedprocessing', color = 25, sprite = 496, radius = 100.0},
--	DrugDealer = {coords = vector3(-1061.75, -1663.49, 4.90), name = 'blip_drugdealer', color = 6, sprite = 378, radius = 25.0},
}