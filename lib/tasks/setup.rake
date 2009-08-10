namespace :setup do

	desc "Perform initial configurations of the application"
	task :initialize => :environment do
		puts 'Starting setup...'
		create_roles
		create_admin
		create_event_types
		create_games
		create_platforms
		puts 'Setup complete!'
	end
	
	def create_roles
		puts 'Creating roles...'
		Role.create({:name => 'Member', :access_level => 1})
		Role.create({:name => 'Organizer', :access_level => 2})
		Role.create({:name => 'Administrator', :access_level =>3})
	end

	def create_admin
		puts 'Creating admin user...'
		user = User.new({
			:login => 'admin',
			:email => 'aurawind@gmail.com',
			:first_name => 'John',
			:last_name => 'Doe',
			:password => 'cats123',
			:password_confirmation => 'cats123'})
		user.save!
		user.reload
			
		UserRole.create({:user_id =>user.id, :role_id => $ACCESS_LEVEL_ADMIN})
	end
  
	def create_event_types
		puts 'Creating event types...'
		EventType.create({:name => 'Gathering', :is_competitive => false})
		EventType.create({:name=> 'Tournament', :is_competitive => true})
	end
  
	def create_games
		puts 'Creating games...'
		Game.create({
			:name => 'BlazBlue',
			:abbreviation => 'BB',
			:developer => 'ARC System Works',
			:publisher => 'Aksys Games'})
			
		Game.create({
			:name => 'The King of Fighters XII',
			:abbreviation => 'KOF12',
			:developer => 'SNK Playmore',
			:publisher => 'Ignition Entertainment'})
			
		Game.create({
			:name => 'Marvel vs Capcom 2',
			:abbreviation => 'MvC2',
			:developer => 'Capcom',
			:publisher => 'Capcom'})
			
		Game.create({
			:name => 'Soul Calibur 4',
			:abbreviation => 'SC4',
			:developer => 'Project Soul',
			:publisher => 'Namco Bandai'})
			
		Game.create({
			:name => 'Super Street Fighter II HD ReMix',
			:abbreviation => 'HDR',
			:developer => 'Backbone Entertainment',
			:publisher => 'Capcom'})
			
		Game.create({
			:name => 'Street Fighter IV',
			:abbreviation => 'SF4',
			:developer => 'Capcom',
			:publisher => 'Capcom'})
			
		Game.create({
			:name =>'Tekken 6' ,
			:abbreviation => 'T6',
			:developer => 'Namco',
			:publisher => 'Namco Bandai'})
	end
	
	def create_platforms
		puts 'Creating platforms'
		Platform.create({:name => 'All Platforms', :abbreviation => 'All'})
		Platform.create({:name => 'Playstation 2', :abbreviation => 'PS2'})
		Platform.create({:name => 'Playstation 3', :abbreviation => 'PS3'})
		Platform.create({:name => 'Xbox 360', :abbreviation => '360'})
		Platform.create({:name => 'Wii', :abbreviation => 'Wii'})
	end
  
  
end