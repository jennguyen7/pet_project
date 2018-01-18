require 'pg'
require 'active_record'


options = {
	adapter: 'postgresql',
	database: 'petfinder'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)