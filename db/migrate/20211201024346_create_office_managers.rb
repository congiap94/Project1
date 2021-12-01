class CreateOfficeManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :office_managers do |t|
      t.integer :user_id
      t.integer :office_id

      t.timestamps
    end
  end
end
