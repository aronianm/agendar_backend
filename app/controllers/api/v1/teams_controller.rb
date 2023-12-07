class Api::V1::TeamsController < ApplicationController
    respond_to :json
    def index
        @teams = Team.find_user_teams(current_user.id)
    end

    def show
        team = Team.find(params[:id]).as_json(
        includes: [:team_players]
        )
    end
end