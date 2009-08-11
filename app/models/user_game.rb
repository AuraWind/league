class UserGame < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	belongs_to :platform
	
	validates_numericality_of :rating, :greater_than => 0, :less_than => 6, :allow_nil => true
end
