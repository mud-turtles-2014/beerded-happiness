# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: "numichuu", password: "test", password_confirmation: "test", phone_number: "123-123-1234", email:"numichuu@gmail.com")
new_event = Event.create(title: "BeerFest", status: "Active", creator_id: user.id)
new_game = Game.create(status: "Active", winner_id: user.id, event: new_event)
new_game.users << user

new_game2 = Game.create(status: "Active", winner_id: user.id, event: new_event)
new_game2.users << user
new_game3 = Game.create(status: "Active", winner_id: user.id, event: new_event)
new_game3.users << user
new_game4 = Game.create(status: "Active", winner_id: user.id, event: new_event)
new_game4.users << user
new_game5 = Game.create(status: "Active", winner_id: user.id, event: new_event)
new_game5.users << user