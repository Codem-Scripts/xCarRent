fx_version 'cerulean'
game 'gta5'
version '1.1'
author 'discord.gg/codem'

shared_scripts {
	'config.lua',
	'GetCore.lua',

}

client_scripts {
	'locales.lua',
	'client.lua',
	'client_editable.lua',

}

server_scripts {
	'server.lua',	
}

ui_page "html/index.html"

files {
	'html/*.html',
	'html/*.css',
	'html/*.js',
	'html/assets/**/*.png',
	'html/assets/**/*.otf',
	'html/assets/**/*.TTF',
	'html/assets/**/*.OTF',
	'html/assets/**/*.svg',

}

escrow_ignore{
	'config.lua',
	'GetCore.lua',
	'client_editable.lua',
	'locales.lua',
}

lua54 'yes'
dependency '/assetpacks'