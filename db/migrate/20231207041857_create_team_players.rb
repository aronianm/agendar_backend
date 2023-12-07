class CreateTeamPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :team_players do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :schedule_id
      t.timestamps
    end

    add_index :team_players, [:user_id, :team_id], :unique => true
  end
end
