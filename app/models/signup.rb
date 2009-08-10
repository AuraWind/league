class Signup < ActiveRecord::Base
	belongs_to :assembly, :polymorphic => true
	belongs_to :user
end
