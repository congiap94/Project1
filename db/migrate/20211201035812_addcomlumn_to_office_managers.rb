class AddcomlumnToOfficeManagers < ActiveRecord::Migration[6.1]
  def change
    add_column :office_managers, :office_id, :integer
    add_column :office_managers, :user_id, :integer
  end
end
