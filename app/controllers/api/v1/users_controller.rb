module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: { status: '200', message: 'OK', data: @users }
      end
    end
  end
end