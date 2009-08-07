class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :date
      t.float :fee
      t.integer :venue_id
      t.boolean :official, :default => false
      t.text :info
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
