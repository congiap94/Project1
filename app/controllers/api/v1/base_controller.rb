# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include HandleControllerError

      def authorize_meeting_room
        policy = ClientPolicy.new(params[:user_id], params[:office_id])
        render_error_message(401, 'You are not admin of offcies') unless policy.admin?
      end

      private

      def render_data(objects, options:, meta:)
        meta[:message] ||= ''
        meta[:status]  ||= 200
        options[:root] ||= 'data'

        render json: objects, **options, meta: meta
      end

      def render_blank_with_message(meta: {})
        meta[:message] ||= 'Successfully'
        meta[:status]  ||= 200
        render json: { data: {}, meta: meta }
      end
    end
  end
end
