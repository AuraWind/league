class Admin::PlatformsController < Admin::AdminController
	
	def index
		@platforms = Platform.all(:order => 'name ASC')
	end
	
	def create
		@platform = Platform.new(params[:platform])
		
		if @platform.save
			flash[:notice] = "#{@platform.name} was successfully created."
			redirect_to :action => :index
		else
			render :action => :new
		end
	end
	
	def edit
		@platform = Platform.find(params[:id])
	end
	
	def update
		@platform = Platform.find(params[:id])
		@platform.attributes = params[:platform]
		
		if @platform.save
			flash[:notice] = "#{@platform.name} was successfully updated."
			redirect_to :action => :index
		else
			render :action => :edit
		end		
	end

end
