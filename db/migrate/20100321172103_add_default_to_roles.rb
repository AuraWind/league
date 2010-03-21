class AddDefaultToRoles < ActiveRecord::Migration
  def self.up
	add_column :roles, :is_default, :boolean, :default => false
  end

  def self.down
	remove_column :roles, :is_default
  end
end
