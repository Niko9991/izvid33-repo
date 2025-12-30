# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = [
  { email_address: "mark@ocene.si", password: "123kop", name: "Admin" },
  { email_address: "lazo@ocene.si", password: "123kop", name: "Lazo" },
  { email_address: "bulc@ocene.si", password: "456kop", name: "Zorica" }
  { email_address: "zorica@bella.si", password: "123kop", name: "Zorica" }
]

users.each do |u|
  User.find_or_create_by!(email_address: u[:email_address]) do |user|
    user.password = u[:password]
    user.password_confirmation = u[:password]
    user.name = u[:name]
  end
end

puts "Users seeded successfully."
