class Event < ActiveRecord::Base
  has_many :games, dependent: :destroy
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

  def current_game 
  	@current_game = self.games.where(status: "current")
  end

  def start_queue
  	if current_game.empty?
  		self.games.second.update(status: "current")
  		self.games.second.users << first_player
  		self.games.first.destroy
  	end
  end

  def first_player
  	self.games.first.users.first
  end
end
