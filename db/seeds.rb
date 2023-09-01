#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

Car.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
Review.destroy_all

array_of_users = []

emails = ["humberto@lewagon.com", "matt@lewagon.com", "ben@lewagon.com", "pedro@lewagon.com" ]

names = ["humberto", "matt", "ben", "pedro"]

user_photos = ["https://ca.slack-edge.com/T02NE0241-U05H2NBRFFY-2422604e0f19-512", "https://ca.slack-edge.com/T02NE0241-U05HJTYFZHP-e8affc977624-512","https://ca.slack-edge.com/T02NE0241-U05GUFPNAF9-29d236e53e03-512", "https://ca.slack-edge.com/T02NE0241-U05GAH9GN5D-d73433a0850a-512"]
#Orange Lambo
car_one = ["https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/masterpieces/gallardo-lp-550-2-2/Gallardo%20LP%20550-2-HEADER.jpg","https://cdn.dealeraccelerate.com/adrenalin/1/1706/44847/1920x1440/2004-lamborghini-gallardo-coupe-twin-turbo","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGIPpLdPOtS7PO_cexcppAOL-cbf8vY5tjqA-9xxMEuhPt1__CB1PMXrXYOfmfDWeiyyQ&usqp=CAU"]
#BMW
car_two = ["https://i.pinimg.com/originals/3c/99/c6/3c99c6d11bad8e68fdc1c1715adf1199.jpg","https://s.yimg.com/ny/api/res/1.2/p9A9czFvi2lQy0VCwFVN3w--/YXBwaWQ9aGlnaGxhbmRlcjtoPTY2Ng--/https://s.yimg.com/os/en_US/News/BusinessInsider/as-a-plug-in-hybrid-sports-car-bmw-i8-is-unlike-anything-on-the-road-today.jpg","https://www.autohausbr.com/wp-content/uploads/2022/04/FF9098BD-69A6-49F9-B6CB-740682D1E292-933x1400.jpeg?&"]
#Rolls Royce phantom
car_three = ["https://i.pinimg.com/originals/ad/a1/d4/ada1d4426c68ff5d2710d23338d72062.jpg","https://atcimages.kbb.com/hn/c/6d6aa6ee22184b97b43533e990f73eb3.jpg","https://cdn05.carsforsale.com/00bbe10e1f3d5d05516a5644047ed817b6/480x360/2007-honda-civic-ex-w-navi-4dr-sedan-1-8l-i4-5a-.jpg"]



car_photos = [car_one, car_two, car_three]

review_description = ["Very nice car", "Fast and confortable", "GOAT"]


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

  puts " creating car n. #{i + 1}"

  manufacturer = Faker::Vehicle.make
  car = Car.new(brand: manufacturer, model: Faker::Vehicle.model(make_of_model: manufacturer),
                year: (1960..2023).to_a.sample, description: Faker::Quote.famous_last_words,
                location: Faker::University.name, user: array_of_users.sample, title: Faker::Cannabis.strain,
                price: rand(50.0..100_000.0))

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
  booking = Booking.new(car_id: Car.all.sample.id, date_from: Date.new(2023, 8, 31), date_until: Date.new(2023, 9, 15), user_id: User.all.sample.id)
end

puts "Seeding is finished! :)"
