require 'sinatra/activerecord'

class Client < ActiveRecord::Base
  self.table_name = 'clients'

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
end