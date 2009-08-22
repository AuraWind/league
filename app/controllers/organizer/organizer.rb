class Organizer::OrganizerController < ApplicationController

	before_filter :login_required
	before_filter :access_required_organizer
	
end
