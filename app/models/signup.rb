class Signup < ActiveRecord::Base
	belongs_to :signupable, :polymorphic => true
	belongs_to :user
	
	validates_uniqueness_of :user_id, :scope => [:signupable_id, :signupable_type]
end
