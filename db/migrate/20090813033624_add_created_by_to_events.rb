class AddCreatedByToEvents < ActiveRecord::Migration
  def self.up
	add_column :events, :created_by, :integer
  end

  def self.down
	remove_column :events, :created_by
  end
end
