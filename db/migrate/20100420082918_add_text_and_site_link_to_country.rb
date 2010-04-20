class AddTextAndSiteLinkToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :extended_description, :text
    add_column :countries, :site_id, :integer
  end

  def self.down
    remove_column :countries, :extended_description
    remove_column :countries, :site_id
  end
end
