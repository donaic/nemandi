class AddSchoolToKlass < ActiveRecord::Migration
  def change
    #add_reference :klasses, :school, index: true
    #add_foreign_key :klasses, :schools
    #drop_table :rosters
  end
end
