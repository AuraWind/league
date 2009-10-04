class UserGameMain < ActiveRecord::Base

	belongs_to :game
	belongs_to :user
	
	validates_presence_of :user_id
	validates_presence_of :game_id
	validates_presence_of :main
	
	validates_uniqueness_of :game_id, :scope => :user_id
end
