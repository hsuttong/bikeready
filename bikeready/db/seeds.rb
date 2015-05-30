# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  user = User.create(first_name: Faker::Name.name,
                     last_name: Faker::Name.name,
                     email: Faker::Internet.email,
                     phone: Faker::PhoneNumber.phone_number,
                     password: 'password')
  Address.create(city:     Faker::Address.city,
                 state:    Faker::Address.state,
                 street:   Faker::Address.street_address,
                 zip_code: Faker::Address.zip,
                 user_id:  user.id)

  Bike.create(make: 'mountain bike', name: 'lorenzo_bike', color: Faker::Commerce.color, status: 'with_user', user_id: user.id)
end

user = User.create(first_name: "Hugh", last_name: "Sutton-Gee", email: "hugh@hugh.com", phone: "415-555-1212", password: 'password')
Bike.create(make: 'mountain bike', name: 'lorenzo_bike', color: Faker::Commerce.color, status: 'with_user', user_id: user.id)
