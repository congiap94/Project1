class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :description
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.integer :recurring_type
      t.boolean :is_recurring
      t.integer :meeting_room_id

      t.timestamps
    end
  end
end
