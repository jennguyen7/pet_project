
require 'active_record'


options = {
	adapter: 'postgresql',
	database: 'petfinder_pres'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)