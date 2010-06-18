set :application, "calendar"
set :repository,  "git@github.com:kleetus/primrose_community_calendar.git"

set :scm, :git

role :web, "kleetus-xen.homelinux.com"
role :app, "kleetus-xen.homelinux.com"                          # This may be the same as your `Web` server
role :db,  "kleetus-xen.homelinux.com", :primary => true # This is where Rails migrations will run


# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end