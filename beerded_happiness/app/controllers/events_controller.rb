class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @active_events = Event.where(status: "Active")
    @inactive_events = Event.where(status: "Inactive")
    @past_events = Event.where(status: "Past")
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)

    redirect_to events_path
  end

  def show
    @games = Event.find(params[:id]).games
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

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :status, :creator_id)
  end

end