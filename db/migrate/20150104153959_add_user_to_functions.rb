class AddUserToregistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :user, index: true
    add_foreign_key :registrations, :users
  end
end
