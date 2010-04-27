class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :name
      t.string :link
      t.integer :linkable_id
      t.string :linkable_type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :links
  end
end
