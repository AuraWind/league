class CreateUserGames < ActiveRecord::Migration
  def self.up
    create_table :user_games do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :platform_id
      t.integer :rating
      t.timestamps
    end
  end

  def self.down
    drop_table :user_games
  end
end
