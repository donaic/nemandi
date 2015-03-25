class Createregistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :registerable, polymorphic: true, index: true
      t.references :role, index: true
      t.integer    :authorization 
      t.timestamps null: false
    end
  end
end
