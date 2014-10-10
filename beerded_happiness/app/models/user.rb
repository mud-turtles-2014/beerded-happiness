class User < ActiveRecord::Base
  has_secure_password

  has_many :event_users
  has_many :events, through: :event_users
  has_many :game_users
  has_many :games, through: :game_users
end