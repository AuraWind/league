# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	helper :all # include all helpers, all the time
	protect_from_forgery # See ActionController::RequestForgeryProtection for details
	
	include AuthenticatedSystem

	# Scrub sensitive parameters from your log
	# filter_parameter_logging :password
  
	def access_required_member
	logger.debug session.to_yaml
		redirect_to '/access_denied.html' and return unless session["user_#{current_user.id}"][:access_level] >= Role.access_level('Member')
	end
	
	def access_required_organizer
		redirect_to '/access_denied.html' and return unless session["user_#{current_user.id}"][:access_level] >= Role.access_level('Organizer')
	end
	
	def access_required_admin
		redirect_to '/access_denied.html' and return unless session["user_#{current_user.id}"][:access_level] >= Role.access_level('Administrator')
	end
	
	def initialize_states
		@states = State.all
	end
	
	def initialize_games
		@games = Game.all(:order => 'name ASC')
	end
	
	def initialize_platforms
		@platforms = Platform.all_specific
	end
  
end
