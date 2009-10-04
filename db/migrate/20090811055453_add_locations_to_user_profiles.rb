class AddLocationsToUserProfiles < ActiveRecord::Migration
  def self.up
	add_column :user_profiles, :city, :string
	add_column :user_profiles, :state_id, :integer
  end

  def self.down
	remove_column :user_profiles, :city
	remove_column :user_profiles, :state_id
  end
end
