     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'petfinder'
require_relative 'db_config'
require_relative 'models/comment'
require_relative 'models/breed'
require_relative 'models/dog'
require_relative 'models/user'

enable :sessions #sinatra provides this feature Server providing unique key to each user

helpers do
	def current_user
		User.find_by(id: session[:user_id])
	end

	def logged_in? # method returns a boolean
		#if you have a session you're logged in
		if session[:user_id]
			return true
		else
			return false
		end
	end
end

get '/' do
	@dogs = Dog.all
	petfinder = Petfinder::Client.new('24f44b534f10c2a471bf61e9fb2949b2', 'a3fc2fd17515a37eddf7e06066363071')
	@breeds = petfinder.breeds('dog') #returns an array
 	erb :index
end

get '/dogs/new' do #this needs to be before /dogs/:id because if it is the other way around it will go to /dogs/:id when you're trying to add a dog
	if !session[:user_id]
		redirect '/login'
	end
	erb :new
end

get '/dogs/:id' do
	if !session[:user_id]
		redirect '/login'
	end
	@dog = Dog.find(params[:id])
	@comments = Comment.where(dog_id: @dog.id)
	erb :show
end

get '/users' do
	erb :users
end


get '/breeds/:breed' do
		if !session[:user_id]
		redirect '/login'
	end
	petfinder = Petfinder::Client.new('24f44b534f10c2a471bf61e9fb2949b2', 'a3fc2fd17515a37eddf7e06066363071')
	@breeds = petfinder.breeds('dog') #returns an array
	
	@breedname = Breed.find_by(breed: params[:breed]) #boolean, if true will return an object
	@comments = Comment.where(breed: @breedname)
	@breed = params[:breed]
	if @breedname
		erb :breeds
	else
		breedname = Breed.new
		breedname.breed = params[:breed]
		breedname.body = params[:body]
	end
	erb :breeds
end


post '/dogs' do
	dog = Dog.new
	dog.name = params[:name]
	dog.breed = params[:breed]
	dog.image_url = params[:image_url]
	dog.description = params[:description]
	dog.sex = params[:sex]
	dog.available_date = params[:available_date]
	dog.postcode = params[:postcode]
	dog.save
	redirect '/'
end


delete '/dogs/:id' do
	dog = Dog.find(params[:id])
	dog.destroy
	redirect '/'
end

post '/comments' do
	#return "hello!"
	comment = Comment.new
	comment.body = params[:body]
	comment.dog_id = params[:dog_id]
	comment.user_id = current_user.id
	comment.save
	redirect "/dogs/#{comment.dog_id}"
end


post '/commentsbreeds' do
	#return "hello!"
	@breed = params[:breed]
	comment = Comment.new
	comment.body = params[:body]
	comment.breed = params[:breed]
	comment.user_id = current_user.id
	comment.save
	redirect "/breeds/#{comment.breed}"
end


post '/users' do
	user = User.new
	user.email = params[:email]
	user.password = params[:password]
	user.save
	redirect '/login'
end

get '/login' do 
	erb :login
end

post '/session' do
	#check email
	user = User.find_by(email: params[:email])

	#check password
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		erb :login
	end

end

delete '/session' do
	#remove key value pair
	session[:user_id] = nil
	redirect '/login'
end




