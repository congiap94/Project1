# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordInvalid, with: :show_errors

      def success_message(code, message, seralizer, content = {})
        ResponseTemplate.success(code, message, content, seralizer)
      end

      def error_message(code, message)
        ResponseTemplate.error(code, message)
      end

      private

      def show_errors(exception)
        render json: error_message(500, exception)
      end
    end
  end
end
