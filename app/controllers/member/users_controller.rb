class Member::UsersController < Member::MemberController
	before_filter :initialize_networked_platforms

	layout 'member_list'
	
	def index
		@users = User.all(:order => 'login ASC')
	end
	
	def mains
		@users = User.all(:order => 'login ASC')
		@games = Game.all(:order => 'name ASC')
	end
	
	def ps3_users
		@users = User.on_ps3
	end
	
	def xbox360_users
		@users = User.on_xbox360
	end
	
	############### private methods ###############
	private
	
	def initialize_networked_platforms
		@networked_platforms = Platform.networked
	end
	
end
