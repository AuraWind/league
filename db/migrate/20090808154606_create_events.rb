class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
	  t.string :name
	  t.integer :event_type_id
	  t.integer :venue_id
	  t.decimal :fee, :default => 0
	  t.text :info
	  t.boolean :is_official, :default => false
	  t.datetime :start_at
	  t.datetime :end_at
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
