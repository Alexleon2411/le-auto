require "faker"
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying all bookings"
Booking.destroy_all
puts "destroying all the cars"
Car.destroy_all
puts "destroying all the users"
User.destroy_all

# creqte a few users

user1 = User.new(
  email: "alpha@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  first_name: "cass",
  last_name: "cal"
)
user1.photo.attach(io: URI.open("https://source.unsplash.com/random/?user"), filename: "nes.jpg", content_type: "image/jpg")
user1.save!


user2 = User.new(
  email: "beta@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)
user2.photo.attach(io: URI.open("https://source.unsplash.com/random/?user"), filename: "nes.jpg", content_type: "image/jpg")
user2.save!


puts 'intiallizing seeding.....'
12.times do
  new_cars = Car.new(model: Faker::Vehicle.make, price: Faker::Commerce.price(range: 50..250, as_string: true), city: Faker::Address.city, year: Faker::Vehicle.year)
  new_cars.user = [user1, user2].sample
  new_cars.photos.attach(io: URI.open("https://source.unsplash.com/random/?car"), filename: "nes.jpg", content_type: "image/jpg")
  sleep(5)
  new_cars.save!

end
puts "seeding successfull"
