class UserMailer < ApplicationMailer

    def alert_signup email, sender, team, utn
        @team = team
        @utn_token = utn.token
        mail(to: email, subject: "#{sender.formatted_name} Agendar Invitation")
    end
end
