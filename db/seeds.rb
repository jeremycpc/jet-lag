# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

jets = ["Jetstar", "Jetmoon", "Jetfire", "Jetice", "Jetwater"]
origins = ["Paris", "Melbourne", "Tokyo", "Saigon", "New York"]
description = ["Very spacious", "The Rock's personal jet", "Will Smith's jet", "5 star jet", "Jet with swimming pool"]
prices = [3000, 5000, 2000, 1000, 2500]
users = [{first_name: "Harrison", email: "harrison@example.com", password: "password"},
  { first_name: "Michael", email: "michael@example.com", password: "password"}]

puts "Creating 5 users"
users.each do |user|
  User.create!(user)
end

url = "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json"
airport_serialized = open(url).read
airports = JSON.parse(airport_serialized)

puts 'Creating airports...'

airports.each do |airport|
  if airport["name"] == ""
    next
  end
  Airport.create!(name: airport["name"], acronym: airport["code"], lat: airport["lat"], lon: airport["lon"])
end

puts 'Done'
puts "Creating 5 jets"

jets.each_with_index do |jet, index|
  Jet.create!(
    name: jet,
    description: description[index],
    has_service: true,
    price: prices[index],
    user_id: 1,
    airport_origin: Airport.all[1..20].sample,
    airport_destination: Airport.all[21..50].sample
    )
end

puts "Finished"

