class MainController < ApplicationController

	def index
		@tournaments = Event.upcoming_tournaments
		@gatherings = Event.upcoming_gatherings
	end

end
