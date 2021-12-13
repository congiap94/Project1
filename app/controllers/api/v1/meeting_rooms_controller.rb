# frozen_string_literal: true

module Api
  module V1
    class MeetingRoomsController < BaseController
      before_action :authorize_meeting_room, only: [:create]
      before_action :load_office, only: %i[create index]

      # POST /offices/:office_id/meeting_rooms
      def create
        meeting_room = @office.meeting_rooms.create! room_params
        render_data  meeting_room, options: { serializer: MeetingRoomSerializer }, meta: { message: 'Successfully' }
      end

      # GET /offices/:office_id/meeting_rooms
      def index
        meeting = @office.meeting_rooms.page(page).per(limit)
        render_paginate_data meeting, options: { each_serializers: MeetingRoomSerializer }
      end

      private

      def room_params
        params.permit(:name, :user_id, :seat)
      end

      def load_office
        @office = Office.find(params[:office_id])
      end
    end
  end
end
