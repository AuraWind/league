class CreateTournamentGameSignups < ActiveRecord::Migration
  def self.up
    create_table :tournament_game_signups do |t|
      t.integer :user_id
      t.integer :tournament_game_id
      t.timestamps
    end
  end

  def self.down
    drop_table :tournament_game_signups
  end
end
