class UpdateEnrollmentTable < ActiveRecord::Migration
  def change
    add_reference :enrollments, :user, index: true
    add_reference :enrollments, :school, index: true
    remove_column :enrollments, :matriculation_id
  end
end
