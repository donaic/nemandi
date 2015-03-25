class RenameRememberTokenRememberMe < ActiveRecord::Migration
  def change
    rename_column :users, :remember_digest, :remember_me
  end
end
