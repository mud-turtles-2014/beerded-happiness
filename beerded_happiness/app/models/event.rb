class Event < ActiveRecord::Base
  has_many :games, dependent: :destroy
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :creator, class_name: "User", foreign_key: :creator_id

  def current_game 
  	@current_game = self.games.find_by(status: "current")
  end

  def start_queue
  	first_pending = self.games.where(status: "pending").first
  	first_user = first_pending.users.first
    first_pending.destroy
  	second_pending = self.games.where(status: "pending").first
    second_pending.users << first_user
    second_pending.update(status: "current")
  end


  def two_games?
    if current_game == nil && self.games.where(status: "pending").count == 2
      start_queue
    end
  end

  def leaderboard
    winners_array = []
    winners_hash = self.games.group('winner_id').order('count_id desc').count('id')
    winners_hash.each do |winner_id, wins|
      winners_array << { User.find_by(id: winner_id).name => wins }
    end
    winners_array
  end

  def currently_playing
    self.current_game.users
  end

  def next_game(winner)
    @next_game = self.games.where(status: "pending").first
    if @next_game
      #@next_game.users.first.notify
      @next_game.users << winner
      @next_game.update(status: "current")
    else
      new_game = self.games.create(status:"pending")
      new_game.users << winner
    end
  end
end

#comment
