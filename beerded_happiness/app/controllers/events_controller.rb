class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @active_events = Event.where(status: "Active")
    @inactive_events = Event.where(status: "Inactive")
    @past_events = Event.where(status: "Past")
  end

  def new
    @event = Event.new
    @current_user = current_user
  end

  def create
    Event.create(event_params)

    redirect_to events_path
  end

  def show
    @event = Event.find(params[:id])
    @games = Event.find(params[:id]).games.where(status: "pending")

    if @event.current_game
      @current_players = @event.currently_playing

      if @event.current_game.is_player?(session[:user_id])
        redirect_to game_path(@event.current_game)
      end
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def search
    if Event.find(params[:q])
      redirect_to event_path(Event.find(params[:q]))
    else
      flash[:search] = "No event found."
      redirect_to events_path
    end
  end


  # def search_post
  #   redirect_to search_events_path(params[:q])
  # end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :status, :creator_id)
  end

end