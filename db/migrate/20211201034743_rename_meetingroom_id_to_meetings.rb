class RenameMeetingroomIdToMeetings < ActiveRecord::Migration[6.1]
  def change
    rename_column :meetings, :meetingroom_id, :meeting_room_id
  end
end
