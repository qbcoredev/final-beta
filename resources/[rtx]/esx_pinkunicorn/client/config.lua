Config = {}

Config.Language = "English"

Config.AntiSpectator = true
Config.SpectatorChecking = 6000
Config.SpectatorChecks = true
Config.SpecChecks = 3
Config.SpecCamDistance = 30
Config.AntiSpectateBypass = false -- its bypass for example player teleporting
Config.AntiSpectateBypassEventName = "qbTYuZqg2OL9uTOmHxX8tLbk9zazJReK" -- How To use it ? Example on player cinematic add this event TriggerEvent("qbTYuZqg2OL9uTOmHxX8tLbk9zazJReK", true) -- its example for enable bypass and for disable TriggerEvent("qbTYuZqg2OL9uTOmHxX8tLbk9zazJReK", false)
Config.AntiSpectateBypassTimedEventName = "d39uGVOkCMRxou0MUgbbcdoDk5SSY1QR" -- How this method work ? You can give bypass for player for like 5 checkings or 1 checking its up to you, add this event to the cinematic function or somewhere where you want TriggerEvent("d39uGVOkCMRxou0MUgbbcdoDk5SSY1QR", 5) for example i put here number 5 so player get bypass for 5 checkings

Config.AntiGodMode = true
Config.InfinityHealth = false
Config.Proofs = false
Config.GodModeChecking = 6000
Config.PlayerMaximumHealth = 200

Config.AntiMaxArmor = true
Config.MaxArmorChecking = 6000
Config.PlayerMaximumArmor = 100

Config.PlayerSpawnedMethod1 = false --activating detectors after is playerspawned via playerSpawned event
Config.PlayerSpawnedMethod2 = false -- activating detectors after is playerloaded via esx:playerLoaded or es:playerLoaded event
Config.PlayerSpawnedMethod3 = false -- activating detectors after is playerloaded via custom event, you need trigger this event while player is spawned or loaded on your core/script
Config.PlayerSpawnedMethod4 = false -- activating detectors after is playerjoined to server.
Config.PlayerSpawnedMethod1EventName = "playerspawned"
Config.PlayerSpawnedMethod2EventName = "es:playerLoaded"
Config.PlayerSpawnedMethod3EventName = "RwLl3iBlyYKbat1ny4Yx33ysHkScfAFQ"

Config.BlockingKeys = false
Config.BlockingKeysChecking = 5
Config.BlockedKeys = { 
	{121}, --INSERT
	{37, 44}, --TAB+Q
	{47, 21}, --SHIFT+G
	{19, 169}, --ALT+F8
	{210, 169}, --CTRL+F8
	{117}, --NUM7
	{214}, --DELETE
}

Config.CheatEngineBlocking = true
Config.CheatEngineChecking = 6000

Config.InjectionResourceDetecting = true

Config.InjectionGlobalDetecting = false

Config.InjectionCommandDetecting = true

Config.InjectionBCDetecting = false

Config.AntiScreenResult = true

Config.SuspiciousResources = false

Config.SuspiciousResourcesChecking = 10000

Config.InjectionChecking = 12000

Config.BlipCheatBlocking = false
Config.BlipsChecking = 60000

Config.AntiSpawningPeds = false
Config.PedChecking = 12000

Config.AntiAggresivePedsWithWeapons = true

Config.AntiInifityAmmo = true
Config.MaximumAmmo = 499
Config.AntiInifityAmmoChecking = 6000

Config.AntiMenyoo = true
Config.AntiMenyooChecking = 6000

Config.AntiRagDoll = false
Config.AntiRagDollChecking = 6000

Config.AntiRadar = false
Config.AntiRadarChecking = 6000

Config.AntiNoDamage = false
Config.AntiNoDamageChecking = 500

Config.AntiLicenseClear = false
Config.AntiLicenseClearChecking = 6000

Config.AntiNoClip = true
Config.NoClipChecking = 3000
Config.NoClipDistanceDetect = 200
Config.NoClipBypass = falsee -- its bypass for example player teleporting
Config.NoClipBypassEventName = "oWd9MnLKdsKv1sJf8iwJKwX0sTJUkrMw" -- How To use it ? Example on player teleport add this event TriggerEvent("oWd9MnLKdsKv1sJf8iwJKwX0sTJUkrMw", true) -- its example for enable bypass and for disable TriggerEvent("oWd9MnLKdsKv1sJf8iwJKwX0sTJUkrMw", false)
Config.NoClipBypassTimedEventName = "ftUzdj4vilUinFLXQykJt6clDlTrsshZ" -- How this method work ? You can give bypass for player for like 5 checkings or 1 checking its up to you, add this event to the teleport function or somewhere where you want TriggerEvent("ftUzdj4vilUinFLXQykJt6clDlTrsshZ", 5) for example i put here number 5 so player get bypass for 5 checkings

Config.AntiTeleport = false
Config.TeleportChecking = 6000
Config.AntiTeleportDistanceDetect = 600
Config.TeleportBypass = true -- its bypass for example player teleporting
Config.TeleportBypassEventName = "TcNSDoLWTCcaS7k1H64mWwFXwaJneu1l" -- How To use it ? Example on player teleport add this event TriggerEvent("TcNSDoLWTCcaS7k1H64mWwFXwaJneu1l", true) -- its example for enable bypass and for disable TriggerEvent("TcNSDoLWTCcaS7k1H64mWwFXwaJneu1l", false)
Config.TeleportBypassTimedEventName = "zgMlK2sQjT1Zo4Td0f2uhtWGQkqAT6aP" -- How this method work ? You can give bypass for player for like 5 checkings or 1 checking its up to you, add this event to the teleport function or somewhere where you want TriggerEvent("zgMlK2sQjT1Zo4Td0f2uhtWGQkqAT6aP", 5) for example i put here number 5 so player get bypass for 5 checkings

Config.AntiInvisible = false
Config.InvisibleChecking = 6000
Config.PlayerMinimumAlpha = 150
Config.InvisibleBypass = true -- its bypass for example player instance
Config.InvisibleBypassEventName = "swpM3pbANu9CjoAb9ezcMQ1eyAQoYCC5" -- How To use it ? Example if player on instance add this event TriggerEvent("swpM3pbANu9CjoAb9ezcMQ1eyAQoYCC5", true) -- its example for enable bypass and for disable TriggerEvent("swpM3pbANu9CjoAb9ezcMQ1eyAQoYCC5", false)
Config.InvisibleBypassTimedEventName = "rxQf5Eka8wZ2Y3OAWbAsF8cV8UF2OQjA" -- How this method work ? You can give bypass for player for like 5 checkings or 1 checking its up to you, add this event to the instance function or somewhere where you want TriggerEvent("rxQf5Eka8wZ2Y3OAWbAsF8cV8UF2OQjA", 5) for example i put here number 5 so player get bypass for 5 checkings

Config.AntiFreeze = false
Config.AntiFreezeChecking = 6000
Config.FreezeBypass = true -- its bypass for example player instance
Config.FreezeBypassEventName = "gZ0gK2Cm1IOJqlB1JQkNEilf75SO3gMa" -- How To use it ? Example if you want freeze player use TriggerEvent("gZ0gK2Cm1IOJqlB1JQkNEilf75SO3gMa", true) -- its example for enable bypass and for disable TriggerEvent("gZ0gK2Cm1IOJqlB1JQkNEilf75SO3gMa", false)
Config.FreezeBypassTimedEventName = "hTtQQv2L43dHeJvZvqLohEmEUJrbImS9" -- How this method work ? You can give bypass for player for like 5 checkings or 1 checking its up to you, add this event to the freeze function TriggerEvent("hTtQQv2L43dHeJvZvqLohEmEUJrbImS9", 5) for example i put here number 5 so player get bypass for 5 checkings

Config.AntiSpeedHack = false
Config.SpeedHackValue = 10.0
Config.SpeedChecking = 12000

Config.AntiVehicleRam = false
Config.VehicleRamChecking = 6000

Config.AntiVehicleSpeedModifier = false
Config.AntiVehicleSpeedModifierChecking = 6000
Config.MaximumVehicleSpeedModifer = 2

Config.AntiLuaFiles = true
Config.AntiLuaFilesChecking = 10000
Config.AntiLuaFilesFilesData = {
	{name = "ham.lua"},
	{name = "fallout.lua"},
	{name = "stars.lua"},
	{name = "rape.lua"},
	{name = "Infinity.lua"},
	{name = "fivex.lua"},
}

Config.AntiSuperJump = false
Config.AntiSuperJumpChecking = 500
Config.AntiSuperJumpMaximumLength = 25

Config.DetectingTriggeringClientEvents = false

Config.GameTimerChecker = false -- Only Use If you have synchronized time

Config.AntiResourceStopper = true

Config.AntiResourceStarter = true

Config.NoExplosionDamage = true
Config.NoExplosionDamageChecking = 500

Config.AntiRandomStringResource = false
Config.AntiRandomStringSimilary = false
Config.AntiRandomStringLenghtCheck = false
Config.AntiRandomStringResourceMaximumLength = 16
Config.AntiRandomStringResourceChecking = 10000
Config.AntiRandomStringResourcesBypass = {
	{name = "esx_"},
	{name = "rtx_"},
	{name = "vrp_"},
	{name = "vrp-"},
	{name = "_"},
	{name = "es_"},
	{name = "-"},
	{name = "essentialmode"},
}

Config.AntiBlacklistedObjectsSpawn = false
Config.ObjectChecking = 12000

Config.AntiModiferDamage = true

Config.WeaponDamageModiferChecking = 8000

Config.AntiDamageChange = true

Config.AntiWeaponsExplosive = true

Config.AntiNightVision = true
Config.NightVisionChecking = 6000
Config.NightVisionBypass = true
Config.NightVisionBypassEventName = "kebWcqZSkMwK7BXGc2wsHZBflHutFamJ" -- How To use it ? Example on equip night vision on item add this event TriggerEvent("kebWcqZSkMwK7BXGc2wsHZBflHutFamJ", true) -- its example for enable bypass and for disable TriggerEvent("kebWcqZSkMwK7BXGc2wsHZBflHutFamJ", false)

Config.AntiThermalVision = true
Config.ThermalVisionChecking = 6000
Config.ThermalVisionBypass = true
Config.ThermalVisionBypassEventName = "uEfkLhwvGMTVs6vSOPuAub2pxwweB8Yp" -- How To use it ? Example on equip night vision on item add this event TriggerEvent("uEfkLhwvGMTVs6vSOPuAub2pxwweB8Yp", true) -- its example for enable bypass and for disable TriggerEvent("uEfkLhwvGMTVs6vSOPuAub2pxwweB8Yp", false)

Config.AntiVehicleSpawning = false
Config.VehicleSpawningChecking = 6000

Config.AntiVehicleSpawningNonWhitelistedPlates = false
Config.AntiVehicleSpawningNonWhitelistedPlatesChecking = 6000

Config.AntiVehicleSpawningNonWhitelisted = false
Config.AntiVehicleSpawningNonWhitelistedChecking = 6000

Config.AntiVehicleTuning = false
Config.VehicleTuningChecking = 3000
Config.VehicleTuningBypass = true
Config.VehicleTuningBypassEventName = "THn5QFIuS3e8gFYRPTAxtIRXsMYoZFtV" -- How To use it ? Example if player on tuning station add this event TriggerEvent("THn5QFIuS3e8gFYRPTAxtIRXsMYoZFtV", true) -- its example for enable bypass and for disable TriggerEvent("THn5QFIuS3e8gFYRPTAxtIRXsMYoZFtV", false)
Config.VehicleTuningBypassTimedEventName = "KkHl5lJPueLvuFi5p54qlqvJ6OMpikEJ" -- How this method work ? You can give bypass for player for like 5 checkings or 1 checking its up to you, add this event to the tuning function or somewhere where you want TriggerEvent("KkHl5lJPueLvuFi5p54qlqvJ6OMpikEJ", 5) for example i put here number 5 so player get bypass for 5 checkings

Config.NuiDevToolsDetect = true

Config.BlackListedVehiclePlates = {
	{name = "BRUTAN"},
}

Config.WhiteListedVehiclePlatesCharacters = {
	{name = "KANI"},
	{name = "RTX"},
	{name = "TEST"},
}

Config.WhiteListedVehicles = {
	{name = "bullet"},
	{name = "infernus"},
	{name = "tyrant"},
}

Config.BlacklistedCommands = {
    "chocolate",
    "haha",
    "lol",
    "panickey",
    "killmenu",
    "panik",
    "ssssss",
    "brutan",
    "panic",
    "brutanpremium",
    "hammafia",
	"purgemenu",
    "hamhaxia",
    "redstonia",
    "hoax",
    "desudo",
    "jd",
    "ham",
    "lua options",
    "God Mode",
    "Maestro",
    "FunCtionOk",
    "lynx9_fixed",
    "Fucked",
	"injected",
	"vRP",
	"deleted due to u being a nigger",
	"Dopamine injected successfully",
    "parent menu doesn",
    "www.d0pamine.xyz",
    "d0pamine v1.1 by Nertigel",
	"d0pamine",
	"lynx",
	"FOriv gay",
	"TiagoModz#1478",
	"WarMenu",
	"tiago",
	"TiagoModz",
	"dopamine",
	"dopamina",
	"Nertigel: This server is protected and the menu is not gonna work here.", 
	"Information",
	"[dopamine]",
	"KP",
	"opk",
	"jolmany",
    "SovietH4X",
}

Config.BlackListedClientEvents = {}

Config.BlacklistedWeaponsForPeds = {}


Config.WeaponDamages = {
	[-1357824103] = { damage = 34, name = "AdvancedRifle"},
    [453432689] = { damage = 26, name = "Pistol"},
    [1593441988] = { damage = 27, name = "CombatPistol"},
    [584646201] = { damage = 25, name = "APPistol"},
    [-1716589765] = { damage = 51, name = "Pistol50"},
    [-1045183535] = { damage = 160, name = "Revolver"},
    [-1076751822] = { damage = 28, name = "SNSPistol"},
    [-771403250] = { damage = 40, name = "HeavyPistol"},
    [137902532] = { damage = 34, name = "VintagePistol"},
    [324215364] = { damage = 21, name = "MicroSMG"},
    [736523883] = { damage = 22, name = "SMG"},
    [-270015777] = { damage = 23, name = "AssaultSMG"},
    [-1121678507] = { damage = 22, name = "MiniSMG"},
    [-619010992] = { damage = 27, name = "MachinePistol"},
    [171789620] = { damage = 22, name = "CombatPDW"},
    [487013001] = { damage = 58, name = "PumpShotgun"},
    [2017895192] = { damage = 40, name = "SawnoffShotgun"},
    [-494615257] = { damage = 32, name = "AssaultShotgun"},
    [-1654528753] = { damage = 14, name = "BullpupShotgun"},
    [984333226] = { damage = 117, name = "HeavyShotgun"},
    [-1074790547] = { damage = 30, name = "AssaultRifle"},
    [-2084633992] = { damage = 32, name = "CarbineRifle"},
    [-1063057011] = { damage = 32, name = "SpecialCarbine"},
    [2132975508] = { damage = 32, name = "BullpupRifle"},
    [1649403952] = { damage = 34, name = "CompactRifle"},
    [-1660422300] = { damage = 40, name = "MG"},
    [2144741730] = { damage = 45, name = "CombatMG"},
    [1627465347] = { damage = 34, name = "Gusenberg"},
    [100416529] = { damage = 101, name = "SniperRifle"},
    [205991906] = { damage = 216, name = "HeavySniper"},
    [-952879014] = { damage = 65, name = "MarksmanRifle"},
    [1119849093] = { damage = 30, name = "Minigun"},
    [-1466123874] = { damage = 165, name = "Musket"},
    [911657153] = { damage = 1, name = "StunGun"},
    [1198879012] = { damage = 10, name = "FlareGun"},
    [-598887786] = { damage = 220, name = "MarksmanPistol"},
    [1834241177] = { damage = 30, name = "Railgun"},
    [-275439685] = { damage = 30, name = "DoubleBarrelShotgun"},
    [-1746263880] = { damage = 81, name = "Double Action Revolver"},
    [-2009644972] = { damage = 30, name = "SNS Pistol Mk II"},
    [-879347409] = { damage = 200, name = "Heavy Revolver Mk II"},
    [-1768145561] = { damage = 32, name = "Special Carbine Mk II"},
    [-2066285827] = { damage = 33, name = "Bullpup Rifle Mk II"},
    [1432025498] = { damage = 32, name = "Pump Shotgun Mk II"},
    [1785463520] = { damage = 75, name = "Marksman Rifle Mk II"},
    [961495388] = { damage = 40, name = "Assault Rifle Mk II"},
    [-86904375] = { damage = 33, name = "Carbine Rifle Mk II"},
    [-608341376] = { damage = 47, name = "Combat MG Mk II"},
    [177293209] = { damage = 230, name = "Heavy Sniper Mk II"},
    [-1075685676] = { damage = 32, name = "Pistol Mk II"},
    [2024373456] = { damage = 25, name = "SMG Mk II"}
}

Config.BlacklistedPedsClient = {}

Config.BlackListedObjectsClient = {}