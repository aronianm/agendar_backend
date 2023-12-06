class TeamsController < ApplicationController

    def index
        render :json => Team.where(:admin_user_id => current_user.id)
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
        team = Team.find(params[:id])
        if team.delete
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


    private
    def teams_params
        params.require('teams').permit(:name)
    end

end
