fx_version "adamant"
games { "gta5" }
dependency "chat"
lua54 "yes"
version "1.0.0"
author "TheStoicBear"
description "Stoic-IDHandler"

client_script "source/client.lua"
server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "source/server.lua"
}

shared_scripts {
    "@ND_Core/init.lua",
    "@ox_lib/init.lua",
    "config.lua"
}


dependency "oxmysql"
