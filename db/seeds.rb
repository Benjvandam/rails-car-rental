# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

Car.destroy_all

array_of_users = []
20.times do
  user = User.create(email: Faker::Internet.email, name: Faker::Name.name,
                     birth_date: Faker::Date.in_date_period, password: '123456',
                     owner: false, address: Faker::Address.street_address)
  array_of_users << user
end

20.times do
  manufacturer = Faker::Vehicle.make
  car = Car.new(brand: manufacturer, model: Faker::Vehicle.model(make_of_model: manufacturer),
                year: (1960..2023).to_a.sample, description: Faker::Quote.famous_last_words,
                location: Faker::University.name, user: array_of_users.sample, title: Faker::Cannabis.strain)

  file1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

  file2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

  file3 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  car.photos.attach([io: file1, filename: "Car1.png", content_type: "image/png"], [io: file2, filename: "Car2.png", content_type: "image/png"], [io: file3, filename: "Car3.png", content_type: "image/png"])

  car.save!
end
