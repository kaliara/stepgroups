require "bundler/capistrano"
# load 'deploy/assets'

default_run_options[:pty] = true

set :ip, "stepgroups.com"
set :port, 30000
set :user, "kaliara"
set :application, ip
role :web, ip
role :app, ip
role :db,  ip, :primary => true

set :repository,  "git://github.com/kaliara/stepgroups.git"
set :deploy_to, "/var/www/stepgroups"
set :deploy_via, :copy

set :scm, :git

set :runner, user

# restart
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :database do
  task :symlink, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :config do
  task :symlink, :roles => :app do
    run "ln -nfs #{shared_path}/config/site_config.yml #{release_path}/config/site_config.yml"
  end
end

# namespace :assets do
#   task :symlink, :roles => :app do
#     run "ln -nfs #{shared_path}/images #{release_path}/public/images"
#   end
# end

# namespace :deploy do  
#   desc "Update the crontab file"  
#   task :update_crontab, :roles => :db do  
#     # run "cd /home/kaliara/public_html/wtd/current && whenever --update-crontab wtd"  
#   end  
# end

after "deploy", "deploy:migrate" 
after "deploy", "deploy:cleanup"
after "deploy:create_symlink", "database:symlink" 
after "deploy:create_symlink", "config:symlink" 
# after "deploy:symlink", "deploy:update_crontab"  
