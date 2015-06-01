# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# 5.times do
#   user = User.create(first_name: Faker::Name.name,
#                      last_name: Faker::Name.name,
#                      email: Faker::Internet.email,
#                      phone: Faker::PhoneNumber.phone_number,
#                      password: 'password')
#   Address.create(city:     Faker::Address.city,
#                  state:    Faker::Address.state,
#                  street:   Faker::Address.street_address,
#                  zip_code: Faker::Address.zip,
#                  user_id:  user.id)

#   Bike.create(make: 'mountain bike', name: 'lorenzo_bike', color: Faker::Commerce.color, status: 'with_user', user_id: user.id)
# end

user1 = User.create(first_name: "Hugh", last_name: "Sutton-Gee", email: "hugh@hugh.com", phone: "415-555-1212", password: 'password')
user2 = User.create(first_name: "Joyce", last_name: "Delt", email: "joyce@test.com", phone: "415-555-1212", password: 'password')
user3 = User.create(first_name: "Derek", last_name: "Tang", email: "derek@derek.com", phone: "415-555-1212", password: 'password')
user4 = User.create(first_name: "Calvin", last_name: "Settachatgul", email: "calvin@calvin.com", phone: "5102208405", password: 'password')

user5 = User.create(first_name: "tranpsorter_first", last_name: "tranpsorter_last", email: "transporter@transporter.com", phone: "5102208405", password: 'password', lat: "10.0000", lng: "20.0000")

bike1 = Bike.create(make: 'mountain bike', name: 'hugh_bike', color: Faker::Commerce.color, status: 'with_user', user_id: 1, transporter_id: 5)
bike2 = Bike.create(make: 'road bike', name: 'joyce_bike', color: Faker::Commerce.color, status: 'with_user',  user_id: 2, transporter_id: 5)
bike3 = Bike.create(make: 'touring bike', name: 'derek_bike', color: Faker::Commerce.color, status: 'with_user' ,  user_id: 3, transporter_id: 5)
bike4 = Bike.create(make: 'race bike', name: 'calvin_bike', color: Faker::Commerce.color, status: 'with_user' ,  user_id: 4, transporter_id: 5)

# Bike.create(make: 'mountain bike', name: 'lorenzo_bike', color: Faker::Commerce.color, status: 'with_user', user_id: user.id)
