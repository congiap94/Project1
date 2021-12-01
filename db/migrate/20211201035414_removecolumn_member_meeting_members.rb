class RemovecolumnMemberMeetingMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :meeting_members, :member
  end
end
