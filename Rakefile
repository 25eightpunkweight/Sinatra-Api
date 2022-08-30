require "./app"
require "sinatra/base"
require "sinatra/activerecord/rake"

desc "run irb console, please begin with 'bundle exec' to include bundled gems."
task :console, :environment do |t, args|
  ENV['RACK_ENV'] = args[:environment] || 'development'

  exec "irb -r irb/completion -r ./app.rb"
end

namespace :db do
  task :load_config do
    require "./app"
  end
end
