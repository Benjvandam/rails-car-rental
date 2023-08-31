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
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
array_of_users = []

emails = ["humberto@lewagon.com", "matt@lewagon.com", "ben@lewagon.com", "pedro@lewagon.com" ]

names = ["humberto", "matt", "ben", "pedro"]

user_photos = []
#Orange Lambo
car_one = ["https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/masterpieces/gallardo-lp-550-2-2/Gallardo%20LP%20550-2-HEADER.jpg","https://cdn.dealeraccelerate.com/adrenalin/1/1706/44847/1920x1440/2004-lamborghini-gallardo-coupe-twin-turbo","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGIPpLdPOtS7PO_cexcppAOL-cbf8vY5tjqA-9xxMEuhPt1__CB1PMXrXYOfmfDWeiyyQ&usqp=CAU"]
#BMW
car_two = ["https://i.pinimg.com/originals/3c/99/c6/3c99c6d11bad8e68fdc1c1715adf1199.jpg","https://s.yimg.com/ny/api/res/1.2/p9A9czFvi2lQy0VCwFVN3w--/YXBwaWQ9aGlnaGxhbmRlcjtoPTY2Ng--/https://s.yimg.com/os/en_US/News/BusinessInsider/as-a-plug-in-hybrid-sports-car-bmw-i8-is-unlike-anything-on-the-road-today.jpg","https://www.autohausbr.com/wp-content/uploads/2022/04/FF9098BD-69A6-49F9-B6CB-740682D1E292-933x1400.jpeg?&"]
#Rolls Royce phantom
car_three = ["https://www.planetcarsz.com/assets/uploads/2021/04/ROLLS%20ROYCE%20WRAITH%20BLACK%20BADGE%20OVERDODE%20BY%20SPOFEC%202021%2002.jpg","https://www.carscoops.com/wp-content/uploads/2019/03/f2cf2d0a-rolls-royce-phantom-tranquillity-4.jpg","https://www.motortrend.com/uploads/2022/11/002-2022-Rolls-Royce-Ghost-Black-Badge.jpg?fit=around%7C875:492"]

car_photos = [car_one, car_two, car_three]

review_description = ["Very nice car", "Fast and confortable", "GOAT"]
booking_price = [rand.]

puts "Starting to seed..."

puts "Seeding users..."
emails.each_with_index do |email, index|
  user = User.new(email: email, name: names[index],
                     birth_date: Faker::Date.in_date_period, password: '123456',
                     owner: false, address: Faker::Address.street_address)
                     file = URI.open(user_photos[index])
                     user.photo.attach(io: file, filename: "prettyasiangirl.png", content_type: "image/png")
                     user.save!
  array_of_users << user
end

puts "Seeding cars..."
3.times do |i|
  manufacturer = Faker::Vehicle.make
  car = Car.new(brand: manufacturer, model: Faker::Vehicle.model(make_of_model: manufacturer),
                year: (1960..2023).to_a.sample, description: Faker::Quote.famous_last_words,
                location: Faker::University.name, user: array_of_users.sample, title: Faker::Cannabis.strain)
  file1 = URI.open(car_photos[i][0])
  file2 = URI.open(car_photos[i][1])
  file3 = URI.open(car_photos[i][2])
  car.photos.attach([io: file1, filename: "Car#{i} - #{i + 1}.png", content_type: "image/png"], [io: file2, filename: "Car2.png", content_type: "image/png"], [io: file3, filename: "Car3.png", content_type: "image/png"])
  car.save!
end
puts "Seeding reviews..."
3.times do |i|
  review = Review.new(car_id: Car.all.sample.id, description: review_description[i], rating: rand(1..5), user_id: User.all.sample.id)
end

puts "Seeding bookings..."
3.times do |i|
  booking = Booking.new(car_id: Car.all.sample.id, price: review_description[i], rating: rand(1..5), user_id: User.all.sample.id)
end


puts "Seeding is finished! :)"
