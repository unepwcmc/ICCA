class UserHasManyRoles < ActiveRecord::Migration
  def self.up
    remove_column :roles, :user_id
    add_column :users, :role_id, :integer
  end

  def self.down
    remove_column :users, :role_id
    add_column :roles, :user_id, :integer
  end
end
