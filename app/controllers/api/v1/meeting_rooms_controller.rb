# frozen_string_literal: true

module Api
  module V1
    class MeetingRoomsController < BaseController
      # POST /meeting_rooms
      def create
        if policy.admin?
          meeting_room = MeetingRoom.create! room_params
          render json: success_message('Successfully', MeetingRoomSerializer, meeting_room)
        else
          render json: error_message(400, 'You are not admin of offcies')
        end
      end

      private

      def room_params
        params.permit(:name, :office_id, :user_id, :seat)
      end

      def policy
        ClientPolicy.new(params[:user_id], params[:office_id])
      end
    end
  end
end
