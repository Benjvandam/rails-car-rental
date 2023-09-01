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
                     file = URI.open(user_photos[index])
                     user.photo.attach(io: file, filename: "prettyasiangirl.png", content_type: "image/png")
                     user.save!
  array_of_users << user
end

puts "Seeding cars..."
3.times do |i|

  puts " creating car n. #{i + 1}"

  manufacturer = Faker::Vehicle.make
  car = Car.new(brand: manufacturer, model: Faker::Vehicle.model(make_of_model: manufacturer),
                year: (1960..2023).to_a.sample, description: Faker::Quote.famous_last_words,
                location: Faker::University.name, user: array_of_users.sample, title: Faker::Cannabis.strain,
                price: rand(50.0..100_000.0))
  file1 = URI.open(car_photo[i][0])
  file2 = URI.open(car_photo[i][1])
  file3 = URI.open(car_photo[i][2])
  car.photos.attach([io: file1, filename: "Car#{i} - #{i + 1}.png", content_type: "image/png"], [io: file2, filename: "Car2.png", content_type: "image/png"], [io: file3, filename: "Car3.png", content_type: "image/png"])
  car.save!
end
puts "Seeding reviews..."
3.times do |i|
  review = Review.new(car_id: Car.all.sample.id, description: review_description[i], rating: rand(1..5), user_id: User.all.sample.id)
end

puts "Seeding bookings..."
3.times do |i|
  booking = Booking.new(car_id: Car.all.sample.id, date_from: Date.new(2023, 8, 31), date_until: Date.new(2023, 9, 15), user_id: User.all.sample.id)
end


puts "Seeding is finished! :)"
