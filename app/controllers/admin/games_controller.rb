class Admin::GamesController < Admin::AdminController

	def index
		@games = Game.all(:order => 'name ASC')
	end
	
	def create
		@game = Game.new(params[:game])
		
		if @game.save
			flash[:notice] = "#{@game.name} was successfully created."
			redirect_to :action => :index
		else
			render :action => :new
		end
	end
	
	def edit
		@game = Game.find(params[:id])
	end
	
	def update
		@game = Game.find(params[:id])
		@game.attributes = params[:game]
		
		if @game.save
			flash[:notice] = "#{@game.name} was successfully updated."
			redirect_to :action => :index
		else
			render :action => :edit
		end		
	end
	
end
