# frozen_string_literal: true

module Api
  module V1
    class MeetingRoomsController < BaseController
      before_action :admin?, only: [:create]

      # POST /meeting_rooms
      def create
        @meeting_room = MeetingRoom.create! room_params

        render json:  success_message(201, 'Successfully', @meeting_room, MeetingRoomSerializer)
      end

      private

      def admin?
        admin = OfficeManager.find_by(user_id: params[:user_id])
        if admin.nil?
          render json: error_message(500, 'You are not admin')
        elsif admin.office_id != params[:office_id].to_i
          render json: error_message(500, 'You are not admin of offcies')
        end
        true
      end

      def room_params
        params.permit(:name, :office_id, :user_id, :seat)
      end
    end
  end
end
