module Api
  module V1
    class BaseController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!
      before_action :authenticate_user_from_token!

      #
      # The user should be authenticated passing its API Token
      # in the request's header, with the format:
      # auth_token: <api_token>
      #
      def authenticate_user_from_token!
        auth_token = request.headers['HTTP_AUTH_TOKEN'].presence
        user = User.find_by(api_token: auth_token)

        if user && auth_token
          sign_in user
        elsif auth_token
          render json: {
            query: false,
            error: 'There aren\'t any user with this Auth Token'
          }, status: 401
        else
          render json: {
            query: false,
            error: 'You must specify the auth_token to use API'
          }, status: 401
        end
      end
    end
  end
end
