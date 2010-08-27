class CreateUserFormLinks < ActiveRecord::Migration
  def self.up
    create_table :user_form_links do |t|
      t.integer :site_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_form_links
  end
end
