class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
	  t.integer :user_id
	  t.date :birth_date
	  t.string :username_xbox360
	  t.string :username_ps3
	  t.string :homepage_url
      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
