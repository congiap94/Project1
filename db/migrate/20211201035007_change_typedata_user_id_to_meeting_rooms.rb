class ChangeTypedataUserIdToMeetingRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :meeting_rooms, :user_id
  end
end
