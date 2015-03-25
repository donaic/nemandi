class RemoveColumnSchoolIdFromEnrollments < ActiveRecord::Migration
  def change
    drop_table :enrollments
    drop_table :matriculations
  end
end
