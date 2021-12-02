class CreateMeetingMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :meeting_members do |t|
      t.integer :member_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
