class AddStatusToKlass < ActiveRecord::Migration
  def change
    add_column :klasses, :status, :integer
  end
end
