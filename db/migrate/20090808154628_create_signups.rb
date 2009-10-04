class CreateSignups < ActiveRecord::Migration
  def self.up
    create_table :signups do |t|
	  t.integer :user_id
	  t.integer :signupable_id
	  t.string :signupable_type	  
      t.timestamps
    end
  end

  def self.down
    drop_table :signups
  end
end
