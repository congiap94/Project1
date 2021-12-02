class CreateMeetingRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :meeting_rooms do |t|
      t.string :name
      t.integer :office_id
      t.integer :user_id
      t.integer :seat

      t.timestamps
    end
  end
end
