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
10.times do
  user = User.create(email: Faker::Internet.email, name: Faker::Name.name,
                     birth_date: Faker::Date.in_date_period, password: '123456',
                     owner: false, address: Faker::Address.street_address)
  array_of_users << user
end

test_users = []
test_users << User.create(email: "robbie@robbie.com", name: "Robbie",
                          birth_date: Faker::Date.in_date_period, password: '123456',
                          owner: false, address: Faker::Address.street_address)

test_users << User.create(email: "mattje@mattje.com", name: "Mattje",
                          birth_date: Faker::Date.in_date_period, password: '123456',
                          owner: true, address: Faker::Address.street_address)

test_users << User.create(email: "humberto@humberto.com", name: "Humberto",
                          birth_date: Faker::Date.in_date_period, password: '123456',
                          owner: true, address: Faker::Address.street_address)

manufacturer = Faker::Vehicle.make
car = Car.new(brand: manufacturer, model: Faker::Vehicle.model(make_of_model: manufacturer),
  year: (1960..2023).to_a.sample, description: Faker::Quote.famous_last_words,
  location: Faker::University.name, user: test_users[1], title: Faker::Cannabis.strain)

  file = URI.open("https://revistacarro.com.br/wp-content/uploads/2022/05/Ferrari-SP48-Unica_3.jpg")
  car.photos.attach(io: file, filename: "nes.png", content_type: "image/png")

  car.save!


manufacturer = Faker::Vehicle.make
car = Car.new(brand: manufacturer, model: Faker::Vehicle.model(make_of_model: manufacturer),
  year: (1960..2023).to_a.sample, description: Faker::Quote.famous_last_words,
  location: Faker::University.name, user: test_users[2], title: Faker::Cannabis.strain)

  file = URI.open("https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2021%2F12%2F1992-ferrari-f40-final-production-year-rare-italian-classic-supercar-mecum-auctions-for-sale-1.jpg")
  car.photos.attach(io: file, filename: "nes.png", content_type: "image/png")

  car.save!

10.times do
  manufacturer = Faker::Vehicle.make
  car = Car.new(brand: manufacturer, model: Faker::Vehicle.model(make_of_model: manufacturer),
                year: (1960..2023).to_a.sample, description: Faker::Quote.famous_last_words,
                location: Faker::University.name, user: array_of_users.sample, title: Faker::Cannabis.strain)

  file = URI.open("https://revistacarro.com.br/wp-content/uploads/2022/05/Ferrari-SP48-Unica_3.jpg")
  car.photos.attach(io: file, filename: "nes.png", content_type: "image/png")

  file = URI.open("https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2021%2F12%2F1992-ferrari-f40-final-production-year-rare-italian-classic-supercar-mecum-auctions-for-sale-1.jpg")
  car.photos.attach(io: file, filename: "nes.png", content_type: "image/png")

  car.save!
end
