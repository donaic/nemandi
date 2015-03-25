class RenameRoleIdInRegistrations < ActiveRecord::Migration
  def change
    rename_column :registrations, :role_id, :role
  end
end
