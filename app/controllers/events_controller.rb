class EventsController < ApplicationController
  def index
    @events = Event.all
    @events_search = EventsSearch.new
  end

  def show
    @event = Event.find(params[:id])
  end
end
