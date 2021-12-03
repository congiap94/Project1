class Api::V1::MeetingRoomController < ApplicationController
  before_action :is_admin?, only: [:create]
  
  def create
    meeting_room = MeetingRoom.new(room_params)
    if meeting_room.save
      render json:  success_message( 'Success', meeting_room, MeetingRoomSerializer )
    else
      render json:  error_message( meeting_room.errors )
    end
  end

  private

  def is_admin?
    admin = OfficeManager.find_by(user_id: params[:user_id])
    if admin.nil?
      render json: error_message( 'You are not admin' )
    elsif admin.office_id != params[:office_id].to_i
      render json: error_message( message: 'You are not admin of offcies' )
    end
  end

  def room_params
    params.permit(:name, :office_id, :user_id, :seat)
  end

end
