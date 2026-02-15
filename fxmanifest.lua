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

--[[ Convars ]]--
convar {
    name = 'hud:circleMap',
    default = 'true',
    description = 'Enable circle map',
    save = true
}
convar {
    name = 'hud:logo',
    default = 'true',
    description = 'Show logo',
    save = true
}
convar {
    name = 'hud:position',
    default = 'bottom',
    description = 'HUD position: top, middle, bottom',
    save = true
}
convar {
    name = 'hud:stress',
    default = 'false',
    description = 'Enable stress status',
    save = true
}
convar {
    name = 'hud:versioncheck',
    default = 'true',
    description = 'Enable version check',
    save = true
}
convar {
    name = 'hud:persistentRadar',
    default = 'false',
    description = 'Keep radar always visible',
    save = true
}
convar {
    name = 'hud:stamina',
    default = 'false',
    description = 'Show stamina indicator',
    save = true
}
convar {
    name = 'hud:hposition',
    default = 'left',
    description = 'HUD horizontal position: left, center, right',
    save = true
}

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
	'server/seatbelt.lua',
	'server/vcheck.lua'
}

ui_page 'web/index.html'

files {
	'web/index.html',
	'web/**/*'
}
