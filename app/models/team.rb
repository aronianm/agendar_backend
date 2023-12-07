class Team < ApplicationRecord

    # hooks
    before_create :generate_access_code

    #relations
    has_many :team_players
    has_one :admin_user, class_name: 'User', foreign_key: :id, primary_key: :admin_user_id



    def self.find_user_teams user_id
        Team.joins(:team_players).where('team_players.user_id' => user_id)
    end

    private
    def generate_access_code
        self.authentification_code = "#{self.admin_user_id}-#{rand(4** 10).to_s.rjust(3,'0')}"
    end
end
