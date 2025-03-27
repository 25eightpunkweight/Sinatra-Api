require 'sinatra/base'
require 'sinatra/activerecord'
require 'json'

class ClientsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  class Client < ActiveRecord::Base
    self.table_name = "clients"
  end

  get '/clients/search' do
    content_type :json

    key = params[:key]
    term = params[:term]

    if key.nil? || term.nil?
      status 400
      return { error: 'Missing search key or term' }.to_json
    end

    begin
      clients = Client.where("LOWER(#{key}) LIKE ?", "%#{term.downcase}%")
      clients.to_json
    rescue ActiveRecord::StatementInvalid => e
      status 400
      { error: "Invalid search key: #{e.message}" }.to_json
    end
  end
end