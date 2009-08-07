class CreatePlatforms < ActiveRecord::Migration
  def self.up
    create_table :platforms do |t|
      t.string :name
      t.string :abbreviation, :limit => 20
      t.timestamps
    end
  end

  def self.down
    drop_table :platforms
  end
end
