class RenameCredentialsToCredentials < ActiveRecord::Migration
  def change
    rename_table :credentials, :credentials
  end
end
