# frozen_string_literal: true

module Api
  module V1
    class MeetingRoomsController < BaseController
      before_action :authorize_meeting_room, only: [:create]
      before_action :page_param, only: [:show]
      # POST /meeting_rooms
      def create
        meeting_room = MeetingRoom.create! room_params
        render_data  meeting_room, options: { serializer: MeetingRoomSerializer }, meta: { message: 'Successfully' }
      end

      def show
        meeting_rooms = MeetingRoom.includes(:office, :user)
                                   .of_office(params[:id])
                                   .page(params[:page]).per(params[:per_page])
        if meeting_rooms.present?
          render_paginate_data meeting_rooms, options: { each_serializers: MeetingRoomSerializer },
                                              meta: meta_attributes(meeting_rooms, message: 'Successfully')
        else
          render_not_found_error("Couldn't find Office")
        end
      end

      private

      def room_params
        params.permit(:name, :office_id, :user_id, :seat)
      end
    end
  end
end
