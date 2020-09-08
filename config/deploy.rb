lock "~> 3.14.1"

set :application, "medapi"
set :repo_url, "git@github.com:bragovo/medapi.git"

set :deploy_to, "/home/deploy/apps/medapi"

append :linked_files, 'config/database.yml', 'config/master.key'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set :keep_releases, 3

set :ssh_options, forward_agent: true
