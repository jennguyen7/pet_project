website: petfinder.com
login: nej.nguyen@gmail.com
Pss: ILovePets17
API Key
24f44b534f10c2a471bf61e9fb2949b2
API Secret
a3fc2fd17515a37eddf7e06066363071

http://api.petfinder.com/my.method?key=24f44b534f10c2a471bf61e9fb2949b2&arg1=foo

http://api.petfinder.com/pet.getRandom?key='24f44b534f10c2a471bf61e9fb2949b2

Petfinder.configure do |config|
  config.api_key = '24f44b534f10c2a471bf61e9fb2949b2'
  config.api_secret = 'a3fc2fd17515a37eddf7e06066363071'
end
petfinder = Petfinder::Client.new


OR

petfinder = Petfinder::Client.new('24f44b534f10c2a471bf61e9fb2949b2', 'a3fc2fd17515a37eddf7e06066363071')


CREATE DATABASE petfinder

http://guides.rubyonrails.org/active_record_basics.html

Activerecord
http://guides.rubyonrails.org/active_record_basics.html