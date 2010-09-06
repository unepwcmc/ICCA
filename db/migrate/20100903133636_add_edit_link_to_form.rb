class AddEditLinkToForm < ActiveRecord::Migration
  def self.up
    add_column :forms, :edit_link, :string
  end

  def self.down
    remove_column :forms, :edit_link
  end
end
