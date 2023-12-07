class UserTeamNotification < ApplicationRecord
    
    before_create :generate_token




    private
    def generate_token
        self.token = "#{rand(4** 4).to_s.rjust(3,'0')}"
    end
end