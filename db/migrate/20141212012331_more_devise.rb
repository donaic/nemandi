class MoreDevise < ActiveRecord::Migration
  def change
    change_table :users do |t|
      ## Trackable
      t.integer :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Recoverable
      t.string  :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
