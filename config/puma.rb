rack_env = ENV['RACK_ENV'] || "development"

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/tmp"

# preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 55755
environment rack_env

# only bind a sock if it's an app meant to be served via apache.
# bind "unix://#{shared_dir}/sockets/puma.sock"

if rack_env == 'development'
  stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true
end

pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"

if rack_env == 'production'
  require 'puma/daemon'
  daemonize
end

activate_control_app

