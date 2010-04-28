class AddPreferredOptionToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :preferred, :boolean
  end

  def self.down
    remove_column :photos, :preferred
  end
end
