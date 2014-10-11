class User < ActiveRecord::Base
  has_secure_password

  has_many :event_users
  has_many :events, through: :event_users
  has_many :game_users
  has_many :games, through: :game_users

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

end
