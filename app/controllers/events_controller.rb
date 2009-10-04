class EventsController < ApplicationController

	def index
		redirect_to :controller => :main
	end

	def show
		@event = Event.find(params[:id])
	end
	
end
