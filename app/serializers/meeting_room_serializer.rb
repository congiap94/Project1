# frozen_string_literal: true

class MeetingRoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :seat, :user_id, :username, :office_name, :office_id

  def username
    object.user.name
  end

  def office_name
    object.office.name
  end
end
