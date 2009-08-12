class Member::EventsController < Member::MemberController
	
	def index
		@user_signups = current_user.upcoming_signups
	end
	
end
