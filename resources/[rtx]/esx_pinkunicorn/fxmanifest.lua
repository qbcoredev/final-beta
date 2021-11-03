fx_version 'adamant'

game 'gta5'

description 'RTX ANTICHEAT'

version '6.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/gate.lua',
	'server/config.lua',
	'language/main.lua',
	'server/main.lua',
	'server/other.lua'
}

client_scripts {
	'client/config.lua',
	'language/main.lua',
	'client/main.lua',
	'client/loops.lua',
	'client/gate.lua',
}

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/BebasNeueBold.ttf',
	'html/img/*.png'
}

ui_page 'html/ui.html'
