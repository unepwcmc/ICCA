class AddTitleToStaticContents < ActiveRecord::Migration
  def self.up
    add_column :static_contents, :title, :string
  end

  def self.down
    remove_column :static_contents, :title
  end
end
