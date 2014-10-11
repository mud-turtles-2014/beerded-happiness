class EventsController < ApplicationController

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

  private

  def event_params
    params.require(:event).permit(:title, :status, :creator_id)
  end

end