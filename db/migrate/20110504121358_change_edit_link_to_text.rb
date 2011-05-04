class ChangeEditLinkToText < ActiveRecord::Migration
  def self.up
    change_column(:forms, :edit_link, :text) 
  end

  def self.down
    change_column(:forms, :edit_link, :string) 
  end
end
