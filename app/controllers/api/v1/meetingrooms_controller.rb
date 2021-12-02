class Api::V1::MeetingroomsController < ApplicationController 
  before_action :is_admin?, only: [:create]
  def create
    meeting_room = MeetingRoom.new(room_params)
    if meeting_room.save
      render json: { meeting_room: ActiveModelSerializers::SerializableResource.new(meeting_room, each_serializer: MeetingRoomSerializer) }
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
      return render json: {  message: 'You are not admin'}
    else
      return render json: {  message: 'You are not admin of offcies'} if admin.office_id != params[:office_id].to_i
    end
  end
end
