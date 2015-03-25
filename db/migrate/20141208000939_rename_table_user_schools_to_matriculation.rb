class RenameTableUserSchoolsToMatriculation < ActiveRecord::Migration
  def change
    rename_table :user_schools, :matriculations
  end
end
