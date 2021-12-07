# frozen_string_literal: true

module Api
  module V1
    class MeetingRoomsController < BaseController
      before_action :authorize_meeting_room, only: [:create]

      # POST /meeting_rooms
      def create
        meeting_room = MeetingRoom.create! room_params
        render json: success_message('Successfully', MeetingRoomSerializer, meeting_room)
      end

      private

      def room_params
        params.permit(:name, :office_id, :user_id, :seat)
      end
    end
  end
end
