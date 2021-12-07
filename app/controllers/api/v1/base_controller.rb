# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include HandleControllerError

      private

      def show_errors(exception)
        render json: error_message(400, exception)
      end

      def show_errors_not_found(exception)
        render json: error_message(404, exception)
      end
    end
  end
end
