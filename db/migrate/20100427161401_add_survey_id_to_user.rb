class AddSurveyIdToUser < ActiveRecord::Migration

  def self.up
    add_column :users, :survey_id, :string
  end

  def self.down
    remove_column :users, :survey_id
  end
end
