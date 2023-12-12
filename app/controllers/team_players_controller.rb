class TeamPlayersController < ApplicationController

    def index
        render :json => TeamPlayer.where(:team_id => params[:team_id]).as_json(include: :user)
    end
end