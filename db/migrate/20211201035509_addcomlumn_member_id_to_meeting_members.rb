class AddcomlumnMemberIdToMeetingMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :meeting_rooms, :member_id, :integer
  end
end
