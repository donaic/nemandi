class RenameenrollmentsToEnrollment < ActiveRecord::Migration
  def change
    rename_table :enrollments, :enrollments
  end
end
