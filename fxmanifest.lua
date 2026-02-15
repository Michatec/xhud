--[[ FX Information ]]--
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--
name 'xhud'
version '1.1.1'
description 'A FiveM HUD for ox_core or ESX Legacy.'
license 'MIT License'
author 'Michatec'
repository 'https://github.com/Michatec/xhud'

--[[ Manifest ]]--
dependencies {
	'ox_lib'
}

shared_scripts {
	'@ox_lib/init.lua',
	'shared/init.lua'
}

client_scripts {
	'client/frameworks.lua',
	'client/hud.lua',
	'client/vehicle.lua',
	'client/minimap.lua',
	'client/seatbelt.lua',
	'client/voice.lua'
}

server_scripts {
	'server/seatbelt.lua'
}

ui_page 'web/index.html'

files {
	'web/index.html',
	'web/**/*'
}
