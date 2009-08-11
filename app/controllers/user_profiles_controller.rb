class UserProfilesController < ApplicationController	
	layout 'default'
	
	before_filter :login_required

	def index
		@user = current_user
		@user_profile = @user.user_profile.blank? ? UserProfile.new : @user.user_profile
	end

end
