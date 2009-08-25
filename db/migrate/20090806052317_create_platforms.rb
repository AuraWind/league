class CreatePlatforms < ActiveRecord::Migration
  def self.up
    create_table :platforms do |t|
      t.string :name
      t.string :abbreviation, :limit => 20
	  t.boolean :is_networked, :boolean => false
	  t.string :network_name
	  t.string :network_name_abbreviation
	  t.string :network_username_name
      t.timestamps
    end
  end

  def self.down
    drop_table :platforms
  end
end
