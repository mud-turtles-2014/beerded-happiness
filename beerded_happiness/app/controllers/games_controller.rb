class GamesController < ActionController::Base
	def new
    @game = Game.new
  end

	def show
		@game = Game.find(params[:id])
	end
end
