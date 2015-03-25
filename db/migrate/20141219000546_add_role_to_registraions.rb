class AddRoleToRegistraions < ActiveRecord::Migration
  def change
    add_reference :registrations, :role, index: true
    add_foreign_key :registrations, :roles
  end
end
