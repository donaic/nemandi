class ChangeMatriculationsColumnNames < ActiveRecord::Migration
  def change
    rename_column :enrollments, :matriculations_id, :matriculation_id
    rename_column :enrollments, :klasses_id, :klass_id
  end
end
