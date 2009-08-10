class UserGame < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	belongs_to :platform
end
