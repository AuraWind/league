class Member::AccountsController < Member::MemberController
	layout 'my_account'
	
	def index
		@user = current_user
		@user_profile = @user.user_profile
	end
	
end
