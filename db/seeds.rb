require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

# creqte a few users

user1 = User.new(
  email: "alpha@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)
user1.save!

user2 = User.new(
  email: "beta@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)
user2.save!

puts 'intiallizing seeding.....'
10.times do
  new_cars = Car.new(model: Faker::Vehicle.make, price: Faker::Commerce.price(range: 1000..10_000, as_string: true), city: Faker::Address.city, year: Faker::Vehicle.year)
  new_cars.user = [user1, user2].sample
  new_cars.save!
end
puts "seeding successfull"
