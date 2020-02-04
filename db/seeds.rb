# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create User To Create Organization and Account Manager
user = User.new(email: "superadmin@mail.com", name: "Superadmin")
user.password = "password123"
user.save
puts "Done Create User"
