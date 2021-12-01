class RemovecomlumnMemberIdMeetingRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :meeting_rooms, :member_id
  end
end
