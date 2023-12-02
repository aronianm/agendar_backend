class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.authentification_code :string
      t.integer :admin_user_id
      t.timestamps
    end
  end
end
