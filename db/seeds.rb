#  Create roles
Role.create({:name => 'Member', :access_level => 1, :is_default => true})
Role.create({:name => 'Organizer', :access_level => 2})
Role.create({:name => 'Administrator', :access_level =>3})

admin_role = Role.find_by_name('Administrator')

# Create admin user
user = User.new({
	:role_id => admin_role.id,
	:login => 'admin',
	:email => 'john@doe.com',
	:first_name => 'John',
	:last_name => 'Doe',
	:password => 'cats123',
	:password_confirmation => 'cats123'})
user.save!
user.reload

# Create event types
EventType.create({:name => 'Gathering', :is_competitive => false})
EventType.create({:name=> 'Tournament', :is_competitive => true})

# Create games
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
	:name => 'Super Street Fighter IV',
	:abbreviation => 'SSF4',
	:developer => 'Capcom',
	:publisher => 'Capcom'})
	
Game.create({
	:name =>'Tekken 6' ,
	:abbreviation => 'T6',
	:developer => 'Namco',
	:publisher => 'Namco Bandai'})
	
# Create platforms
Platform.create({:name => 'All Platforms', :abbreviation => 'All'})
Platform.create({:name => 'Playstation 2', :abbreviation => 'PS2'})
Platform.create({:name => 'Playstation 3', :abbreviation => 'PS3', :is_networked => true, :network_name => 'Playstation Network', :network_name_abbreviation => 'PSN', :network_username_name => 'ID'})
Platform.create({:name => 'Xbox 360', :abbreviation => '360', :is_networked => true, :network_name => 'Xbox Live!', :network_name_abbreviation => 'XBL', :network_username_name => 'Gamertag'})
Platform.create({:name => 'Wii', :abbreviation => 'Wii'})

# Create states
states = [
	[ "Alabama", "AL" ], 
	[ "Alaska", "AK" ], 
	[ "Arizona", "AZ" ], 
	[ "Arkansas", "AR" ], 
	[ "California", "CA" ], 
	[ "Colorado", "CO" ], 
	[ "Connecticut", "CT" ], 
	[ "Delaware", "DE" ], 
	[ "District Of Columbia", "DC" ], 
	[ "Florida", "FL" ], 
	[ "Georgia", "GA" ], 
	[ "Hawaii", "HI" ], 
	[ "Idaho", "ID" ], 
	[ "Illinois", "IL" ], 
	[ "Indiana", "IN" ], 
	[ "Iowa", "IA" ], 
	[ "Kansas", "KS" ], 
	[ "Kentucky", "KY" ], 
	[ "Louisiana", "LA" ], 
	[ "Maine", "ME" ], 
	[ "Maryland", "MD" ], 
	[ "Massachusetts", "MA" ], 
	[ "Michigan", "MI" ], 
	[ "Minnesota", "MN" ], 
	[ "Mississippi", "MS" ], 
	[ "Missouri", "MO" ], 
	[ "Montana", "MT" ], 
	[ "Nebraska", "NE" ], 
	[ "Nevada", "NV" ], 
	[ "New Hampshire", "NH" ], 
	[ "New Jersey", "NJ" ], 
	[ "New Mexico", "NM" ], 
	[ "New York", "NY" ], 
	[ "North Carolina", "NC" ], 
	[ "North Dakota", "ND" ], 
	[ "Ohio", "OH" ], 
	[ "Oklahoma", "OK" ], 
	[ "Oregon", "OR" ], 
	[ "Pennsylvania", "PA" ], 
	[ "Rhode Island", "RI" ], 
	[ "South Carolina", "SC" ], 
	[ "South Dakota", "SD" ], 
	[ "Tennessee", "TN" ], 
	[ "Texas", "TX" ], 
	[ "Utah", "UT" ], 
	[ "Vermont", "VT" ], 
	[ "Virginia", "VA" ], 
	[ "Washington", "WA" ], 
	[ "West Virginia", "WV" ], 
	[ "Wisconsin", "WI" ], 
	[ "Wyoming", "WY" ]]
	
states.each do |state|
	State.create({:name => state[0], :abbreviation => state[1]})
end

