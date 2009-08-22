class Admin::AdminController < ApplicationController

	before_filter :login_required
	before_filter :access_required_admin
	
	layout 'admin'
	
end
