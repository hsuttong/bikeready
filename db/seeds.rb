# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

user1 = User.create(first_name: "Hugh", last_name: "Sutton-Gee", email: "hsuttong@gmail.com", phone: "4159353844", password: 'password')
user2 = User.create(first_name: "Joyce", last_name: "Delatore", email: "joycedelatorre87@gmail.com", phone: "123-456-7890", password: 'password')
user3 = User.create(first_name: "Derek", last_name: "Tang", email: "derekztang@gmail.com", phone: "4158121901", password: 'password')
user4 = User.create(first_name: "Calvin", last_name: "Settachatgul", email: "calvin.settachatgul@gmail.com", phone: "5102208405", password: 'password')

user1.bikes.create(make: 'mountain bike', name: 'hugh_bike', color: Faker::Commerce.color, status: 'storage')
user2.bikes.create(make: 'road bike', name: 'joyce_bike', color: Faker::Commerce.color, status: 'storage')
user3.bikes.create(make: 'touring bike', name: 'derek_bike', color: Faker::Commerce.color, status: 'storage')
user4.bikes.create(make: 'race bike', name: 'calvin_bike', color: Faker::Commerce.color, status: 'storage')

(2..4).each do |i|
   Address.create(street:   Faker::Address.street_address,
                  city:     Faker::Address.city,
                  state:    Faker::Address.state,
                  zip_code: Faker::Address.zip,
                  user_id:  i)
end

Address.create( street:   '33 Montclair Terrace',
                city:     'San Francisco',
                state:    'CA',
                zip_code: '94109',
                user_id:  1)
