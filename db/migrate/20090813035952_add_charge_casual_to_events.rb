class AddChargeCasualToEvents < ActiveRecord::Migration
  def self.up
	add_column :events, :charge_casual, :boolean, :default => false
  end

  def self.down
	remove_column :events, :charge_casual
  end
end
