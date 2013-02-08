require "rvm/capistrano"
require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"


#settings
#rvm
set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")
set :rvm_install_ruby_params, '--1.9'      # for jruby/rbx default to 1.9 mode
# set :rvm_install_pkgs, %w[libyaml openssl] # package list from https://rvm.io/packages
set :rvm_install_ruby_params, '--with-opt-dir=/usr/local/rvm/usr' # package support

set :rvm_type, :user
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
# before 'deploy:setup', 'rvm:install_pkgs'  # install RVM packages before Ruby
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset
before 'deploy:setup', 'rvm:import_gemset' # import gemset from file


#SCM
set :repository, "git@github.com:ransanjeev/mtnl_directory.git"
set :scm, :git
set :branch, "master"
# set :deploy_via, :copy
 # set :repository_cache, "git_cache"
 # set :deploy_via, :remote_cache
 set :ssh_options, { :forward_agent => true }
set :normalize_asset_timestamps, false

#user
set :application, "mtnl_directory"
set :admin_runner, "mtnl_directory"
set :user , "mtnl_directory"
set :recipient , "Ruby"

#deploy_to
set :deploy_to, "/home/#{user}/apps/#{application}"

role :web, "ec2-107-21-67-161.compute-1.amazonaws.com" 
role :db, "ec2-107-21-67-161.compute-1.amazonaws.com" , primary:true
role :app, "ec2-107-21-67-161.compute-1.amazonaws.com" 

  
#ssh options
set :ssh_options, {:forward_agent => true}
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
# ssh_options[:verbose] = :debug
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_mtnl_directory_rsa")]

