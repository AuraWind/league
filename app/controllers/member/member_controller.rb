class Member::MemberController < ApplicationController

	layout 'default'

	before_filter :login_required
	before_filter :access_required_member
	
end
