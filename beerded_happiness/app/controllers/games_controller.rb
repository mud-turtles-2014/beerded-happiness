class GamesController < ActionController::Base
	def new
    @game = Game.new
  end

	def show
		@game = Game.find(params[:id])
	end

	def create
		@event = Event.find(params[:event_id])
		@game  = Game.create(status:"pending")
		@game.users << User.find(session[:user_id])
		@event.games << @game
		@event.two_games?
		redirect_to event_path(@event)
	end

	def update
		p "****************"
		p params
		p "****************"
	end
end
