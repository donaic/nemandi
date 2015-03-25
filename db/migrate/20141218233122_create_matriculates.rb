class Createenrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user, index: true
      t.references :school, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :users
    add_foreign_key :enrollments, :schools
  end
end
