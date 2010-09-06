class AddSiteIdToDocument < ActiveRecord::Migration
  def self.up
    add_column :documents, :site_id, :integer
  end

  def self.down
    remove_column :documents, :site_id
  end
end
