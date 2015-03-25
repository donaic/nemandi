class UpdateRegistrations < ActiveRecord::Migration
  def change
    change_table :registrations do |t|
      t.references :registerable, polymorphic: true, index: true
    end
  end
end
