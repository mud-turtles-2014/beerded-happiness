class EventsController < ApplicationController

  def index
    @active_events = Event.where(status: "active")
    @inactive_events = Event.where(status: "inactive")
    @past_events = Event.where(status: "past")
  end

  def new
    @event = Event.new
  end

end