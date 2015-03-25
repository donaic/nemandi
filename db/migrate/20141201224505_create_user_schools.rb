class CreateUserSchools < ActiveRecord::Migration
  def change
    create_table :user_schools do |t|
      t.references :user, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
