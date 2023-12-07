class UserNotificationSignUp < ActiveRecord::Migration[7.0]
  def change
    create_table :user_team_notifications do |t|
      t.string :email
      t.integer :team_id
      t.string :token
      t.timestamps
    end

    add_index :user_team_notifications, [:email, :team_id], :unique => true
    
  end
end
