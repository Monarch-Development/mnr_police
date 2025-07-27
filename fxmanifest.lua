fx_version "cerulean"
game "gta5"
lua54 "yes"

name "mnr_police"
description "Police Job"
author "IlMelons"
version "1.0.0"
repository "https://www.github.com/Monarch-Development/mnr_police"

ox_lib "locale"

shared_scripts {
	"@ox_lib/init.lua",
	"config/shared/*.lua",
}

client_scripts {
	"bridge/client/**/*.lua",
	"config/client/*.lua",
	"client/*.lua",
}

server_scripts {
	"bridge/server/**/*.lua",
	"config/server/*.lua",
	"server/*.lua",
}

files {
	"locales/*.json",
}