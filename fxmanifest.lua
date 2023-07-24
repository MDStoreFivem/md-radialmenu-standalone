fx_version 'cerulean'
game 'gta5'

version '1.0.0'
author 'MD Store'

ui_page 'web/index.html'
files {'web/index.html', 'web/**/*'}

client_script 'client/*.lua'
shared_scripts {
    'config.lua',
}
