class Member::GamesController < Member::MemberController
	layout 'my_account'
		
	before_filter :initialize_games, :only => [:new, :edit, :create, :update]
	before_filter :initialize_platforms, :only => [:new, :edit, :create, :update]
	
	def index
		@user_games = current_user.user_games
	end
	
	def create
		@user_game = current_user.user_games.new(params[:user_game])
		if @user_game.save
			flash[:notice] = "#{@user_game.game.name} was added to your collection."
			redirect_to :action => :index
		else
			flash[:error] = "Unable to add the game to your collection."
			render :action => :new
		end
	end
	
	def edit
		@user_game = current_user.user_games.find(params[:id])
	end
	
	def update
		@user_game = current_user.user_games.find(params[:id])
		@user_game.rating = params[:user_game][:rating]
		if @user_game.save
			flash[:notice] = "#{@user_game.game.name} was updated."
			redirect_to :action => :index
		else
			flash[:error] = "Unable to update #{@user_game.game_name}."
			render :action => :new
		end
	end
	
	def destroy
		@user_game = current_user.user_games.find(params[:id])
		game = @user_game.game
		if @user_game.destroy
			flash[:notice] = "#{game.name} was removed from your collection."
		else
			flash[:error] = "Unable to remove #{game.name} from your collection."
		end
		redirect_to :action => :index
	end
	
	################# private methods #################
	private
	
	def initialize_games
		@games = Game.all(:order => 'name ASC')
	end
	
	def initialize_platforms
		@platforms = Platform.all_specific
	end
	
end
