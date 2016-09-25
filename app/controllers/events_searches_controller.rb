class EventsSearchesController < ApplicationController
  before_action :authenticate_user!, except: :new

  def show
    @events_search = EventsSearch.find(params[:id])
    @events = EventQuery.new(@events_search).search
    render 'events/index'
  end

  def index
    @events_searches = current_user.events_searches
  end

  def new
    @events_search = EventsSearch.new(events_search_params)
    if @events_search.empty?
      redirect_to root_url
    else
      @events = EventQuery.new(@events_search).search
    end
  end

  def create
    @events_search = EventsSearch.new(events_search_params)
    if ! @events_search.empty?
      @events_search.update!(user: current_user)
      redirect_to @events_search, notice: 'Your query was saved'
    else
      redirect_to root_url, alert: 'Can not save empty query'
    end
  end

  def destroy
    @events_search = EventsSearch.find(params[:id])
    @events_search.destroy
    redirect_to events_searches_url
  end

  private

  def events_search_params
    params.require(:events_search).permit(:city_id, :name, :from_date, :to_date)
  end
end
