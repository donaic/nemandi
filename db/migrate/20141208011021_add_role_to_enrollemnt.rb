class AddRoleToEnrollemnt < ActiveRecord::Migration
  def change
    add_reference :enrollments, :role, index: true
  end
end
