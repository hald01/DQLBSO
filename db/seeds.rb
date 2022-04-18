# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin = User.create!(name:  "Admin",
             email: "admin@gmail.com",
             password:              "852963",
             password_confirmation: "852963",
             age:   "18",
             address:"10.Ngo Gia Tu - Hai Chau - Da Nang",
             phone: "19001000",
             admin: true
             )
admin.create_cart()

for test_user_id in 2...10 do
  user = User.create(name: "User 00#{test_user_id}",
            email: "test00#{test_user_id}@gmail.com",
            password: "123456",
            password_confirmation: "123456")   
  user.create_cart()
end

# while test_user_id<50 do
#   User.create(name: "User 0#{test_user_id}",
#               email: "test0#{test_user_id}@gmail.com",
#               password: "123456",
#               password_confirmation: "123456")   
#   test_user_id+=1
# end

# until test_user_id>=90 do
#   User.create(name: "User 0#{test_user_id}",
#               email: "test0#{test_user_id}@gmail.com",
#               password: "123456",
#               password_confirmation: "123456")   
#   test_user_id+=1
# end

# (90..100).each do |test_user_id|
#   User.create(name: "User 0#{test_user_id}",
#               email: "test0#{test_user_id}@gmail.com",
#               password: "123456",
#               password_confirmation: "123456")   
# end

for test_book_id in 1...20 do
  Book.create(name: "Connan ep-#{test_book_id}",
            price: "1#{test_book_id}",
            number: "22"
  )    
end
