class AddTypeToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :authorization, :integer
  end
end
