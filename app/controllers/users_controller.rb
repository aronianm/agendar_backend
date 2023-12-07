class UsersController < ApplicationController
    def index
        render :json => current_user.as_json(
            only: [
            :id,
            :fname,
            :lname,
            :email,
            :phone_number
    ]
        )
    end
    def new_users
        team = Team.find(params[:team_id])
        admin_user = team.admin_user
        emails = params[:emails]
        emails.each do |i, email|
            utn = UserTeamNotification.new(email: email, team_id: team.id)
            if utn.save
                um = UserMailer.alert_signup(email, admin_user, team, utn)
                um.deliver_now
            end
        end
    end
end 