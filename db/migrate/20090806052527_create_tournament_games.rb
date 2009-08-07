class CreateTournamentGames < ActiveRecord::Migration
  def self.up
    create_table :tournament_games do |t|
      t.integer :tournament_id
      t.integer :game_id
      t.integer :platform_id
      t.float :fee
      t.time :start_at
      t.time :end_at
      t.timestamps
    end
  end

  def self.down
    drop_table :tournament_games
  end
end
