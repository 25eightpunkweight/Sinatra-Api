# Let's get Frank
source "https://rubygems.org"

gem "rack"
gem "sinatra"
gem "sinatra-activerecord"
gem "sinatra-contrib"
gem "builder" # nice to have
gem "bson_ext" # no need unless I have to use mongodb?
gem "logger"
gem "mime-types" # feels like I'm gonna need this at some point, though noctools-smokeping-matrix didn't even need this.
gem "resque" # I can maybe do this instead of manually setting up CRON jobs
gem "whenever" # alternative to resque, you can do bundler commands for setting cron jobs
gem "puma"
gem "rake"
gem "json"
gem "pg"
gem "config"

# some gems specifically for the requirements of the particular app that uses the boilerplate.
# this is intentionally kept empty at the start.
# ===================
#
# ===================


# some gems from the boilerplate I chose not to install
# ===================
# gem "haml" # no need
# gem "bson", "= 1.3.1" # no need unless I have to use mongodb?
# gem "sinatra-flash" #keep until I figure out to do this natively
# gem "pony" # not sure if this dashboard will need to send emails + needs accounts and auth to get it working
# gem "omniauth" # kambi sso makes this not needed anymore
# gem "will_paginate", "~> 3.0" # frontend is handled by an external js app, I can do pagination manually.
# gem "data_mapper" # remove in favor of activerecord
# gem "foreman" # not sure if I'll need this since we manually setup systemd services at production
# gem "fog" # keep, maybe we'll need it?
# ===================



group :development, :test do
  gem "awesome_print", :require => 'ap' # where have you been all my life
  gem "pry" # ol' reliable
end

group :test do
  gem "rspec"
  gem "rack-test"
end

group :development, :test do
  gem "cucumber" # will have to learn cucumber...
end


group :production do
  gem "puma-daemon" # daemonize the production build
  # will need some more gems here depending on the app.
end