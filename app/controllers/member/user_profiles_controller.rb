class Member::UserProfilesController < Member::MemberController
	before_filter :initialize_states, :only => [:edit, :update]
	before_filter :initialize_networked_platforms

	layout 'my_account'

	def index
		@user = current_user
		@user_profile = @user.user_profile
	end
	
	def edit
		@user_profile = current_user.user_profile
	end
	
	def update
		@user_profile = current_user.user_profile
		@user_profile.attributes = params[:user_profile]
		if @user_profile.save
			flash[:notice] = 'Profile was successfully updated.'
			redirect_to :action => :index
		else
			flash[:error] = 'Profile could not be updated.'
			render :action => :edit
		end
	end
	
	############ private methods #############
	private
	
	def initialize_networked_platforms
		@networked_platforms = Platform.networked
	end
	
end
