Locale                          = Locale or {}

Locale.en = { -- en is the reference that will be used for 'Config.Language'
	StandaloneLapText			= "~r~E~w~ - Ask for a lap dance", -- Set the text that will be displayed above marker if 'Config.Framework' is set to 'standalone'
	LapText						= "~r~E~w~ - Thuê Một Vũ Công (~g~" .. Config.LapDanceCost .. "$~w~)", -- Set the text that will be displayed above marker
	BoughtLapdance				= "Bạn Đã Thuê Một Vũ Công Với 120$", -- Notification text when a lap dance is bought
	StripperActive				= "The stripper is already busy!", -- Notification text if a stripper is already active when you try to buy a lap dance
	StripperPause				= "The stripper needs some rest!", -- Notification text if a player wants to directly buy another lapdance within 10 seconds of finishing their last one
	NotEnoughMoney				= "You do not have enough money. A lap dance costs 100$" -- Notification text if player don't have enough cash
}