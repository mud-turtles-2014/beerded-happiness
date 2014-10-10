class Game < ActiveRecord::Base
  belongs_to :event
  has_many :game_users
  has_many :users, through: :game_users
  belongs_to :winner, class_name: "User", foreign_key: :user_id
end