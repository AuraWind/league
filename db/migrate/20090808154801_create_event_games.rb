class CreateEventGames < ActiveRecord::Migration
  def self.up
    create_table :event_games do |t|
	  t.string :name
	  t.integer :event_id
	  t.integer :game_id
	  t.integer :platform_id
	  t.float :fee, :default => 0
	  t.text :info
	  t.datetime :start_at
	  t.datetime :end_at
      t.timestamps
    end
  end

  def self.down
    drop_table :event_games
  end
end
