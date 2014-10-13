class User < ActiveRecord::Base
  has_secure_password

  has_many :event_users
  has_many :events, through: :event_users
  has_many :game_users
  has_many :games, through: :game_users

  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  def notify(opponent)

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']

		@client.account.messages.create({
			:from => '+16467833007', 
			:to => self.phone_number, 
			:body => "It is your turn to play Beer Pong!, you will be playing #{opponent.name}",  
		})
	end

  def has_pending_games?
    games = self.games
    if games.select{|game| game.status == "pending"}.count > 0
      return true
    else
      return false
    end
  end

  def games_to_go
    if self.has_pending_games?
      @event = self.games.where(status: "pending").last.event
      p "*" * 10 
      p @event
      @event.games.where(status: "pending").take_while{|game| game.is_player?(self.id) == false}.count
    else
      return false
    end
  end

end
