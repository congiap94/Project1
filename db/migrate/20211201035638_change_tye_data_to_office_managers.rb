class ChangeTyeDataToOfficeManagers < ActiveRecord::Migration[6.1]
  def change
    remove_column :office_managers, :user_id
    remove_column :office_managers, :office_id
  end
end
