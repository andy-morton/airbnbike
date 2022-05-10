# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Deleting current Bikes'
5.times do
  print('.')
  sleep(0.2)
end
Bike.destroy_all
puts 'Bikes destroyed'

10.times do
  user = User.find(rand(1..3))
  name = "#{Faker::Color.color_name} #{Faker::Creature::Animal.name}"
  description = "This bike is faster than a really fast #{Faker::Vehicle.make} driven by #{Faker::Games::SuperMario.character}"
  location = Faker::Address.city
  price = rand(10..100)
  Bike.create(user: user, name: name, description: description, location: location, price: price)
end

puts "Bikes seeded"
