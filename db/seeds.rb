# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying flats..."
Flat.destroy_all if Rails.env.development?

puts "Creating new flats..."

4.times do
  new_flat = Flat.new(
    name: "#{Faker::Cannabis.cannabinoid}, #{Faker::Job.title}",
    address: Faker::Address.full_address,
    description: "#{Faker::ChuckNorris.fact}, #{Faker::Lorem.paragraph_by_chars(number: 2000)}",
    price_per_night: (10..120).to_a.sample.to_i,
    number_of_guests: (1..10).to_a.sample.to_i
  )
  new_flat.save!
  puts "Created #{new_flat.name} for #{new_flat.number_of_guests} guests with a price per night of #{new_flat.price_per_night}"
end

puts "Flats all created"
