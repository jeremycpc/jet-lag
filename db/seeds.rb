require 'json'
require 'open-uri'
require 'faker'

puts "Creating users..."

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Internet.password(8)
    )
  end

puts 'Done'
puts 'Now creating airports...'

url = "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json"
airport_serialized = open(url).read
airports = JSON.parse(airport_serialized)

airports.each do |airport|
  if airport["name"] == ""
    next
  end
  Airport.create!(name: airport["name"], acronym: airport["code"], lat: airport["lat"].to_f, lon: airport["lon"].to_f)
end

puts 'Done'
puts 'Now creating jets trip 1...'

25.times do
  jet = Jet.create!(
    name: Faker::Space.star,
    description: Faker::Lorem.paragraphs(1),
    has_service: true,
    start_on: Faker::Date.between(40.days.ago, Date.yesterday),
    end_on: Faker::Date.forward(150),
    max_capacity: (1..8).to_a.sample,
    price: (1500..15000).to_a.sample,
    user_id: (1..10).to_a.sample,
    airport_origin: Airport.find(1667),
    airport_destination: Airport.find(1901),
    )
  end

puts 'Done'
puts 'Now creating jets trip 2...'

25.times do
  jet = Jet.create!(
    name: Faker::Space.star,
    description: Faker::Lorem.paragraphs(1),
    has_service: true,
    start_on: Faker::Date.between(40.days.ago, Date.yesterday),
    end_on: Faker::Date.forward(150),
    max_capacity: (1..8).to_a.sample,
    price: (1500..15000).to_a.sample,
    user_id: (1..10).to_a.sample,
    airport_origin: Airport.find(1338),
    airport_destination: Airport.find(2799),
    )
  end

puts 'Done'
puts 'All finished'
