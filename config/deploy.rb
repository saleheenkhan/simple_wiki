# config valid only for current version of Capistrano
lock "3.9.1"

set :application, "simple_wiki"
set :repo_url, "git@github.com:nynhex/simple_wiki.git"

set :deploy_to, '/home/deploy/simple_wiki'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
# Default value for :pty is false
# set :pty, true
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
 set :keep_releases, 5
