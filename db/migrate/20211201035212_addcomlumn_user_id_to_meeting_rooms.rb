class AddcomlumnUserIdToMeetingRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :meeting_rooms, :user_id, :integer
  end
end
