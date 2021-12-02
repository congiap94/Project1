module Api
  module V1
    class MeetingroomsController < ApplicationController
      before_action :is_admin?, only: [:create]
      def create
        meeting_room = MeetingRoom.new(room_params)
        if meeting_room.save
          render json: { meeting_room: ActiveModelSerializers::SerializableResource.new(meeting_room,
                                                                                        each_serializer: MeetingRoomSerializer) }
        else
          render json: meeting_room.errors, status: :unprocessable_entity
        end
      end

      private

      def room_params
        params.permit(:name, :office_id, :user_id, :seat)
      end

      def is_admin?
        admin = OfficeManager.find_by(user_id: params[:user_id])
        if admin.nil?
          render json: { message: 'You are not admin' }
        elsif admin.office_id != params[:office_id].to_i
          render json: { message: 'You are not admin of offcies' }
        end
      end
    end
  end
end
