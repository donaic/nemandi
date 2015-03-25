class ChangeToRegistration < ActiveRecord::Migration
  def change
    rename_table :registrations, :registrations
  end
end
