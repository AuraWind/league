class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state, :limit => 2
      t.string :postal_code
      t.string :phone
      t.string :info
      t.boolean :public, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
