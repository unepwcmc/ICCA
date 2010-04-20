class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.string :lat
      t.string :lon
      t.text :extended_description
      t.integer :country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
