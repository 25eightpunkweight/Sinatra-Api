# filepath: spec/spec_helper.rb
require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../app.rb', __FILE__)

RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    App
  end
end