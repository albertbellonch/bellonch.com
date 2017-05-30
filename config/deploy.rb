# Application
set :application, "bellonch.com"

# Repo & connection
set :scm, :git
set :repo_url, "git@github.com:albertbellonch/bellonch.com.git"
set :user, :deployer
set :port, 8622
set :ssh_options, { user: fetch(:user), port: fetch(:port), forward_agent: true }

# Misc
set :keep_releases, 5
set :pty, false

# Roles
server "moroder.bellonch.com", roles: %i{ web }, primary: true

# Hooks
after "deploy:publishing", "jekyll:install"
