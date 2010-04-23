class AddCitationToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :citation, :string
  end

  def self.down
    remove_column :photos, :citation
  end
end
