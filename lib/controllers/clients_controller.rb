require 'sinatra/base'
require 'sinatra/activerecord'
require 'json'

class ClientsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  # Define the Client model (assuming you have one)
  class Client < ActiveRecord::Base
    self.table_name = "clients" # Replace with your actual table name
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