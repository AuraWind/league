class CreateUserGameMains < ActiveRecord::Migration
  def self.up
    create_table :user_game_mains do |t|
	  t.integer :user_id
	  t.integer :game_id
	  t.string :main
      t.timestamps
    end
  end

  def self.down
    drop_table :user_game_mains
  end
end
