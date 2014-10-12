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
		@game = Game.find(params[:id])
		
		if params[:won] == "true"
			
			@winner = User.find(session[:user_id])
			p"*****************"
			p "WE ARE IN THE TRUE BRANCH"
			p params[:won]
			p "****************"
		else
			p"*****************"
			p params[:won]
			p "****************"
			@winner = @game.users.where.not(id: session[:user_id]).first
		end 
		@game.declare_winner(@winner)
		
		redirect_to event_path(@game.event)

	end
end
