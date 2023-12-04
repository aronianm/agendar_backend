class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :authentification_code, unique: true
      t.integer :admin_user_id
      t.timestamps
    end
  end
end
