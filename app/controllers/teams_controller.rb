class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :destroy]

    def index
        render :json => Team.where(:admin_user_id => current_user.id)
    end

    def show
        render :json => @team
    end

    def create
        team = Team.new(teams_params)
        team.admin_user_id = current_user.id
        if team.save
            render json: {
                status: 200,
                data: current_user,
                message: 'Succesfully created team'
            }, status: :ok
        else
            render json: {
                status: 500,
                message: "Could not save"
            }, status: :error
        end
    end

    def destroy
        if @team.delete
            render json: {
                status: 200,
                data: current_user,
                message: 'Succesfully deleted team'
            }, status: :ok
        else
            render json: {
                status: 500,
                message: "Could not delete team"
            }, status: :error
        end
    end

    def signup
        tc = UserTeamNotification.find_by(token: teams_params[:user_code])
        team = Team.find_by(authentification_code: teams_params[:team_code])
        fail = false
        if tc && team
            unless tc.email == current_user.email
                fail = true
            else
                tp = TeamPlayer.new(
                    team_id: team.id,
                    user_id: current_user.id
                )
                tc.delete
                unless tp.save
                    fail = true
                end
            end
        else
            fail = true
        end

        if fail
            render json: {
                status: 200,
                message: 'Sucessfully joined Team'
            },        status: :ok
        else
            render json: {
                status: 401,
                message: 'Unsucessfully joined Team'
            }, status: :unauthorized
        end
    end


    private
    def teams_params
        params.require('teams').permit(:name, :user_code, :team_code)
    end

    private

    def set_team
        @team = Team.find(params[:id])
    end
end
