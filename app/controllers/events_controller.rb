class EventsController < ApplicationController
  def create
  	@event = Event.create(event_params)
  end

  def new
  	@event = Event.new
  end
  protected
  	def event_params
  		params.require(:event).permit(:date, :title, :description)
  	end
end
