# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create a default development user for everyone to use
User.create(email: "dev@email.com", password: "password")

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: "password"
  )
  user.save!
end
puts 'Finished!'