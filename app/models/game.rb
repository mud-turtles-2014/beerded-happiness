class Game < ActiveRecord::Base
  belongs_to :event
  has_many :game_users
  has_many :users, through: :game_users
  belongs_to :winner, class_name: "User", foreign_key: :user_id

  def is_player?(player_id)
  	self.users.exists?(player_id)
  end

  def declare_winner(winner)

  	self.update(winner_id: winner.id)
		self.update(status: "ended")
 		self.event.next_game(winner)
  end
end