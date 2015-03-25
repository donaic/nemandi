class DropTables < ActiveRecord::Migration
  def change
    drop_table :enrollments
    drop_table :registrations
  end
end
