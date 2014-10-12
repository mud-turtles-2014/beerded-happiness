# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: "numichuu", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"numichuu@gmail.com")
user2 = User.create(name: "bob", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"bob@gmail.com")
user3 = User.create(name: "jane", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"jane@gmail.com")
user4 = User.create(name: "scott", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"scott@gmail.com")
user5 = User.create(name: "zoe", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"zoe@gmail.com")

new_event = Event.create(title: "BeerFest", status: "Active", creator_id: user.id)
new_game = Game.create(status: "ended", winner_id: user.id, event: new_event)
new_game.users << user

new_game2 = Game.create(status: "ended", winner_id: user3.id, event: new_event)
new_game2.users << user3

new_game3 = Game.create(status: "ended", winner_id: user3.id, event: new_event)
new_game3.users << user4

new_game4 = Game.create(status: "ended", winner_id: user3.id, event: new_event)
new_game4.users << user5

new_game5 = Game.create(status: "ended", winner_id: user2.id, event: new_event)
new_game5.users << user