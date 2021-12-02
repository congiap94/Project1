class Api::V1::MeetingRoomController < ApplicationController
  before_action :is_admin?, only: [:create]

  def create
    meeting_room = MeetingRoom.new(name: params[:name], user_id: params[:user_id], office_id: params[:office_id], seat: params[:seat])
    if meeting_room.save
      render json: success_message( 'Successfully',  meeting_room: ActiveModelSerializers::SerializableResource.new(meeting_room,
      each_serializer: MeetingRoomSerializer)  )
    else
      render json:  error_message( 'Meeting room not save' )
    end
  end

  private

  def is_admin?
    admin = OfficeManager.find_by!(user_id: params[:user_id])
    if admin.nil?
      render json: error_message( 'You are not admin' )
    elsif admin.office_id != params[:office_id].to_i
      render json: error_message( message: 'You are not admin of offcies' )
    end
  end
  
end
