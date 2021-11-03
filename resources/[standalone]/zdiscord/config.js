/*
    zdiscord - by zfbx ♥ - https://github.com/zfbx/zdiscord - License: MIT Open Source
    Setup and Help guide on the github page ^^^^^^^^^^^^^^^
*/

const config = {
    // Discord bot token to connect to the bot
    // Get token from https://discord.com/developers/applications (create app > bot > create bot > copy token) [don't forget to invite the bot to your server]
    token: GetConvar("discord_token", "ODY0NDIyNzUzMTcxNDA2ODY5.YO1ObA.w5vWS-ynLB6PkAcl6YRP6Njil8c"),

    // The prefix needed for a message to be recognized as a command ( ie: !help )
    prefix: GetConvar("discord_prefix", "!"),

    // Locale to use for translations from locales folder (Default "en" English)
    lang: GetConvar("discord_lang", "vn"),

    // This name is used throughout the locale to autofill blanks to refer to your server
    serverName: GetConvar("discord_server_name", "HYDRA"),

    // Permanent Invite link for your discord server - Used by locale to autofill where people need to go to join.
    discordInvite: GetConvar("discord_invite", "https://discord.gg/HYDRARP"),

    // Whether to actually check whitelist status, turning this to false will let everyone in
    enableWhitelist: GetConvar("discord_enable_whitelist", "false"),

    // Whether to run commands or ignore all
    enableCommands: GetConvar("discord_enable_commands", "true"),

    // Whether to update bot status
    enableStatus: GetConvar("discord_enable_status", "true"),

    // Color of the embed replies on discord for help and such (defaults purple #663A82)
    // This needs to be entered in hex form (#ff00ff -> 0xff00ff) without quotes around it
    embedColor: 0x663A82,

    // Your discord server ID [See above for help]
    guildid: GetConvar("discord_guild_id", "892370890686349382"), // My Cool Server ID

    // Discord role id for mods role (kick, ban)
    modRole: GetConvar("discord_mod_role", "892371532838469632"),

    // Discord role id for mods role (mod actions + kickall, announcements)
    adminRole: GetConvar("discord_admin_role", "892371532838469632"),

    // Discord role id for mods role (mod and admin actions + setpermissions)
    godRole: GetConvar("discord_god_role", "892371532838469632"),


    // List of role IDs (comma seperated) that will be able to join the server
    whitelistRoles: GetConvar("discord_whitelist_roles", "892373201508790305, 892373201508790305"),

    // The bot status message will randomly select one of these statuses every 30 seconds
    // {{playercount}} will automatically be replaced with the current number of users online
    // {{servername}} will be replaced the serverName above
    // {{invite}} will be replaced with the invite above
    // {{prefix}} will be replaced with the prefix currenting being used from above
    statusMessages: [
        "{{prefix}}help",
        "{{playercount}} online",
    ],
}