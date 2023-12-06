class Team < ApplicationRecord

    before_create :generate_access_code




    private
    def generate_access_code
        self.authentification_code = "#{self.admin_user_id}-#{rand(10 ** 10).to_s.rjust(10,'0')}"
    end
end
