# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include HandleControllerError

      def authorize_meeting_room
        policy = ClientPolicy.new(params[:user_id], params[:office_id])
        render_error_message(401, 'You are not admin of offcies') unless policy.admin?
      end

      def page_param
        params[:page] || 1
        params[:per_page] = 3 unless params[:per_page].present?
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

      def render_paginate_data(objects, options:, meta: {})
        meta[:message] ||= ''
        meta[:status]  ||= 200
        options[:root] ||= 'data'

        render json: objects, **options, meta: meta_attributes(objects, meta)
      end

      def meta_attributes(collection, extra_meta = {})
        {
          current_page: collection.current_page,
          next_page: collection.next_page,
          prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
          total_pages: collection.total_pages,
          total_count: collection.total_count
        }.merge(extra_meta)
      end
    end
  end
end
