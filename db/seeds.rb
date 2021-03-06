# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Test User 1", email: "test_user_1@email.com", telephone: "1111111111", password: "password", password_confirmation: "password", admin: false)
User.create(name: "Test User 2", email: "test_user_2@email.com", telephone: "1111111111", password: "password", password_confirmation: "password", admin: false)
User.create(name: "Test Admin 1", email: "test_admin_1@email.com", telephone: "1111111111", password: "password", password_confirmation: "password", admin: true)
User.create(name: "Test Admin 2", email: "test_admin_2@email.com", telephone: "1111111111", password: "password", password_confirmation: "password", admin: true)


Room.create(name: "Room 1", occupancy: "4", cost: 50)
Room.create(name: "Room 2", occupancy: "6", cost: 80)
Room.create(name: "Room 3", occupancy: "8", cost: 100)
Room.create(name: "Room 4", occupancy: "3", cost: 60)


Reservation.create(user_id: "1", room_id: "1", guests: "2", check_in: "2020-05-01", check_out: "2020-06-01", discount: "0.0", total: "1500")
Reservation.create(user_id: "1", room_id: "2", guests: "4", check_in: "2020-03-01", check_out: "2020-04-01", discount: "0.0", total: "2400")
Reservation.create(user_id: "2", room_id: "3", guests: "3", check_in: "2020-06-01", check_out: "2020-07-01", discount: "0.0", total: "3000")
Reservation.create(user_id: "2", room_id: "4", guests: "3", check_in: "2020-08-01", check_out: "2020-09-01", discount: "0.0", total: "1800")