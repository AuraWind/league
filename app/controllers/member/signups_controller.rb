class Member::SignupsController < Member::MemberController

	def create
		event = Event.upcoming_all.find(params[:event_id])
		if event.blank?
			flash[:error] = 'Sorry, you can not sign up for this event.'
		else
			@signup = event.signups.new({:user_id =>current_user.id})
			if @signup.save
				flash[:notice] = 'You have signed up for this event.'
			else
				flash[:error] = 'Could not sign you up for this event.  Have you already signed up?'
			end
		end
		redirect_to :controller => '/member/events', :action => :index
	end

end
