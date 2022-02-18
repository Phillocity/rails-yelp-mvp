# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do
  restaurant = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.street_address,
                              phone_number: Faker::PhoneNumber.phone_number_with_country_code, category: %w[chinese italian japanese french belgian].sample)
  restaurant.save!

  rand(1..10).times do
    review = Review.new(rating: rand(1..5), restaurant: restaurant, content: Faker::TvShows::BojackHorseman.quote)
    review.save!
  end
end
