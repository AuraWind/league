class AddLocationsToUserProfiles < ActiveRecord::Migration
  def self.up
	add_column :user_profiles, :city, :string
	add_column :user_profiles, :state, :string
  end

  def self.down
	remove_column :user_profiles, :city
	remove_column :user_profiles, :state
  end
end
