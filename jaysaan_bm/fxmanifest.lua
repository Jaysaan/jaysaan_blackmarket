fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Jaysaan'
description 'Simple black market script with ox_lib'

shared_scripts {

    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'sh/*.lua'

}

client_scripts {

    'cl/*.lua'

}

server_scripts {

    'sv/*.lua'

}

file 'locales/*.json'

