class Admin::UsersController < Admin::AdminController
	before_filter :initialize_roles, :only => [:new, :create, :edit, :update]

	def index
		@users = User.all(:order => 'login ASC')
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(params[:user])
		@user_role = UserRole.new(params[:user_role])
		
		if @user.save
			@user_role.user_id = @user.id
			@user_role.save
		
			flash[:notice] = "#{@user.name} was successfully created."
			redirect_to :action => :index
		else
			logger.debug @user.to_yaml
			render :action => :new
		end
	end
	
	def edit
		@user = User.find(params[:id])
		@user_role = @user.user_role
	end
	
	def update
		@user = User.find(params[:id])
		@user.attributes = params[:user]
		
		@user_role = @user.user_role
		@user_role.attributes = params[:user_role]
		
		if @user.save
			@user_role.save
			flash[:notice] = "#{@user.name} was successfully updated."
			redirect_to :action => :index
		else
			render :action => :edit
		end		
	end
	
	def edit_password
	end
	
	def update_password
	end
	
	
	############## private methods ###############
	private
	
	def initialize_roles
		@roles = Role.all(:order => 'access_level ASC')
	end

end
