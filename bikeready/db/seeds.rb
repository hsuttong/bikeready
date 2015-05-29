# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  user = User.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, password_digest: 'password')
end

1.times do
  bike = Bike.create(make: 'mountain bike', name: 'lorenzo_bike', color: 'yellow', status: 'in transit', user_id: 1)
end
