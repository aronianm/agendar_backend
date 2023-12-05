class Api::V1::UsersController < ApplicationController
    respond_to :json

    def authenticate
        if request.headers['Authorization'].present?
            jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key!).first
            current_user = User.find(jwt_payload['sub'])
        end

        if current_user
            render json: {
              status: 200,
              data: current_user,
              message: 'Authenticated.'
            }, status: :ok
          else
            render json: {
              status: 401,
              message: "Couldn't find an active session."
            }, status: :unauthorized
          end
    end
end