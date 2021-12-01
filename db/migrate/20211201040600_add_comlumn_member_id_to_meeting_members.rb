class AddComlumnMemberIdToMeetingMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :meeting_members, :member_id, :integer
  end
end
