class Family::EventsController < Family::Base

  def index 
    @events = Event.published.page(params[:page])
  end

  def show
    @event = Event.published.find(params[:id])
  end
  
end
