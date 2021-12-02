# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
5.times do
  Office.create( name:Faker::Address.city,
                 address:Faker::Address.street_address )
end

20.times do 
  User.create( name:Faker::Name.name,
               email:Faker::Internet.email,
               phone:Faker::PhoneNumber.cell_phone_in_e164,
               office_id:rand(1..99) )
end

10.times do
  OfficeManager.create ( office_id: rand(1..99), 
                         user_id: rand(1..99) )
end

