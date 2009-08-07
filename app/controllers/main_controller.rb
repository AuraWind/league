class MainController < ApplicationController

	layout 'default'

	def index
		@tournaments = Tournament.find(:all)
		@events = Event.find(:all)
	end

end
