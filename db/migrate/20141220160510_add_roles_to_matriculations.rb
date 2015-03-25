class AddRolesToMatriculations < ActiveRecord::Migration
  def change
    add_reference :enrollments, :role, index: true
    add_foreign_key :enrollments, :roles
  end
end
