class Event < ActiveRecord::Base
  has_many :games, dependent: :destroy
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

end
