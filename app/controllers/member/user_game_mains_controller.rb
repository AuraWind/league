class Member::UserGameMainsController < Member::MemberController
	layout 'my_account'
	
	before_filter :initialize_games, :only => [:new, :create, :edit, :update]
	
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
	
	def edit
		@user_game_main = current_user.user_game_mains.find(params[:id])
	end
	
	def update
		@user_game_main = current_user.user_game_mains.find(params[:id])
		@user_game_main.attributes = params[:user_game_main]
		
		if @user_game_main.save
			flash[:notice] = "#{@user_game_main.main} was added as your #{@user_game_main.game.name} main."
			redirect_to :action => :index
		else
			render :action => :edit
		end
	end
	
	def destroy
		@user_game_main = current_user.user_game_mains.find(params[:id])
		if @user_game_main.destroy
			flash[:notice] = 'Your main has been deleted.'
		else
			flash[:error] = 'Unable to delete this main.'
		end
		redirect_to :action => :index
	end
	
	################# private methods ################
	private
	
end
