require 'sqlite3'
require 'active_record'
require 'active_record/deselect'
require 'pry'


ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

RSpec.configure do |config|
end
