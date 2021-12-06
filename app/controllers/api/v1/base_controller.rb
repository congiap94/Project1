# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordInvalid, with: :show_errors
      rescue_from ActiveRecord::RecordNotFound, with: :show_errors_not_found

      include HandleControllerError

      private

      def show_errors(exception)
        render json: error_message(400, exception)
      end

      def show_errors_not_found
        render json: error_message(404, 'User not admin')
      end
    end
  end
end
