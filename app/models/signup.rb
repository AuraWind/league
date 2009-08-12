class Signup < ActiveRecord::Base
	belongs_to :signupable, :polymorphic => true
	belongs_to :user
end
