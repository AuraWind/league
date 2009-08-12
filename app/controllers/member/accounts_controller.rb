class Member::AccountsController < Member::MemberController
	
	def index
		@user = current_user
		@user_profile = @user.user_profile
	end
	
end
