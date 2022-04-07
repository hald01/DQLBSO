# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name:  "Admin",
             email: "admin@gmail.com",
             password:              "852963",
             password_confirmation: "852963",
             age:   "18",
             address:"10.Ngo Gia Tu - Hai Chau - Da Nang",
             phone: "19001000",
             admin: true
             )

for a in 2...10 do
  User.create(   name: "User 00#{a}",
            email: "test00#{a}@gmail.com",
            password: "123456",
            password_confirmation: "123456")    
end

$b=10

while $b<100 do
  User.create(   name: "User 0#{$b}",
              email: "test0#{$b}@gmail.com",
              password: "123456",
              password_confirmation: "123456")   
  $b+=1
end
