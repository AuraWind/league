class Member::UserGameMainsController < Member::MemberController
	layout 'my_account'
	
	before_filter :initialize_games, :only => [:new, :create]
	
	def index
		@user_game_mains = current_user.user_game_mains
	end
	
	def create
		@user_game_main = current_user.user_game_mains.new(params[:user_game_main])
		if @user_game_main.save
			flash[:notice] = "#{@user_game_main.main} was saved as your #{@user_game_main.game.name} main."
			redirect_to :action => :index
		else
			render :action => :new
		end
	end
	
	################# private methods ################
	private
	
	def initialize_games
		@games = Game.all(:order => 'name ASC')
	end
	
end
