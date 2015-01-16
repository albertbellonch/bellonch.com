load 'deploy'
load 'config/deploy'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

require 'capistrano/ext/multistage'
require 'capistrano_colors'
