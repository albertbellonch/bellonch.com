# General
set :application, "bellonch.com"
set :keep_releases, 5
set :deploy_to, "/var/www/html/jekyll/bellonch.com"

# Stages
set :stages, %w(production)
set :default_stage, "production"

# SCM
set :scm, :git
set :deploy_via, :remote_cache
set :repository, "git@github.com:albertbellonch/bellonch.com.git"
set :ssh_options, { port: 8622 }

# Users
set :use_sudo, false
set :user, "deployer"

# Roles
role :web, "moroder.bellonch.com"

# Recipes
after "deploy:create_symlink" do
  run "rm -rf #{release_path}/config #{release_path}/Capfile"
  run "cd #{release_path} && jekyll build --config _config_production.yml"
end
