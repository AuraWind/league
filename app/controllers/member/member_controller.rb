class Member::MemberController < ApplicationController

	before_filter :login_required
	before_filter :access_required_member
	
end
