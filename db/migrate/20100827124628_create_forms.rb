class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.integer :site_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
