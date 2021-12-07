# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include HandleControllerError

      def authorize_meeting_room
        render json: error_message(400, 'You are not admin of offcies') unless policy.admin?
      end

      private

      def success_message(message, seralizer, content = {})
        ResponseTemplate.success(message, content, seralizer)
      end

      def policy
        ClientPolicy.new(params[:user_id], params[:office_id])
      end
    end
  end
end
