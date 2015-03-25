class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true
      t.references :klass, index: true

      t.timestamps null: false
    end
    add_foreign_key :registrations, :users
    add_foreign_key :registrations, :klasses
  end
end
