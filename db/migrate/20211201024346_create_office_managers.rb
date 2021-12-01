class CreateOfficeManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :office_managers do |t|
      t.string :user_id
      t.string :office_id

      t.timestamps
    end
  end
end
