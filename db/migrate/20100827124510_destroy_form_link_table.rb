class DestroyFormLinkTable < ActiveRecord::Migration
  def self.up
    drop_table :user_form_links
  end

  def self.down
    create_table :user_form_links do |t|
      t.integer :site_id
      t.integer :user_id

      t.timestamps
    end
  end
end
