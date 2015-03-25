class ChangeColumnNameInRoles < ActiveRecord::Migration
  def change
    rename_column :roles, :type, :title
  end
end
