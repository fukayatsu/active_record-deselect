require 'sqlite3'
require 'active_record'
require 'pry'


ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

require 'active_record/deselect'

RSpec.configure do |config|
end
