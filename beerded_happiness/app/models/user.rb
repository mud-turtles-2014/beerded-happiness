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
			:body => 'It is your turn to play Beer Pong!, you will be playing #{opponent.name}',  
		})
	end

end
