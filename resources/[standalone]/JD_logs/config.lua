Config = {}

Config.AllLogs = false											-- Enable/Disable All Logs Channel
Config.postal = true  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "Bot Username Here" 							-- Bot Username
Config.avatar = "https://via.placeholder.com/30x30"				-- Bot Avatar
Config.communtiyName = "Community Name Here"					-- Icon top of the embed
Config.communtiyLogo = "https://via.placeholder.com/30x30"		-- Icon top of the embed
Config.FooterText = "2020 - 2021 © Prefech"						-- Footer text for the embed
Config.FooterIcon = "https://via.placeholder.com/30x30"			-- Footer icon for the embed


Config.weaponLog = false  			-- set to false to disable the shooting weapon logs
Config.InlineFields = false			-- set to false if you don't want the player details next to each other

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs
Config.license = true				-- set to false to disable license in the logs
Config.IP = true					-- set to false to disable IP in the logs

-- Change color of the default embeds here
-- It used Decimal or Hex color codes. They will both work.
Config.BaseColors ={		-- For more info have a look at the docs: https://docs.prefech.com
	chat = "#A1A1A1",				-- Chat Message
	joins = "#3AF241",				-- Player Connecting
	leaving = "#F23A3A",			-- Player Disconnected
	deaths = "#000000",				-- Shooting a weapon
	shooting = "#2E66F2",			-- Player Died
	resources = "#EBEE3F",			-- Resource Stopped/Started	
}


Config.webhooks = {		-- For more info have a look at the docs: https://docs.prefech.com
	all = "DISCORD_WEBHOOK",		-- All logs will be send to this channel
	chat = "https://discordapp.com/api/webhooks/892396055306575952/aQS7RI-PwyRsaBIy6nLkyY9Su4BBuq1utX5Wx4cmC71HglN8Yx6Q-llSO0FJNQd5-Uwh",		-- Chat Message
	joins = "https://discordapp.com/api/webhooks/892396150315950092/fxp3fApSGrPHFeIMpkEb6eohtHs8-qVXt3wO08Yc-nxA6Z_pk_ZDQyp6ziakspQcsBvC",		-- Player Connecting
	leaving = "https://discordapp.com/api/webhooks/892396150315950092/fxp3fApSGrPHFeIMpkEb6eohtHs8-qVXt3wO08Yc-nxA6Z_pk_ZDQyp6ziakspQcsBvC",	-- Player Disconnected
	deaths = "https://discordapp.com/api/webhooks/892396273238417429/n8I8eGE_YH_XN82fmcQUfODowtgQG-gCtVqMG5vjTiSBsVn3SzIH7Bvp0F-htvelHQpg",		-- Shooting a weapon
	shooting = "DISCORD_WEBHOOK",	-- Player Died
	resources = "DISCORD_WEBHOOK",	-- Resource Stopped/Started	
}

Config.TitleIcon = {		-- For more info have a look at the docs: https://docs.prefech.com
	chat = "💬",				-- Chat Message
	joins = "📥",				-- Player Connecting
	leaving = "📤",			-- Player Disconnected
	deaths = "💀",				-- Shooting a weapon
	shooting = "🔫",			-- Player Died
	resources = "🔧",			-- Resource Stopped/Started	
}

Config.Plugins = {
	--["PluginName"] = {color = "#FFFFFF", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
	["NameChange"] = {color = "#03fc98", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
}


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.3.0"
