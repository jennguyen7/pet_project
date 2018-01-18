class User < ActiveRecord::Base
	has_secure_password
	#So that bcrypt can create a virtual attribute called password for the user
end