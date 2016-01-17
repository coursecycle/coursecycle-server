# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

role :app, %w{dolphin@api.coursecycle.com}
role :web, %w{dolphin@api.coursecycle.com}
role :db,  %w{dolphin@api.coursecycle.com}

server 'api.coursecycle.com', user: 'dolphin', roles: %w{web app}

set :rails_env, "production"
