class RemovecomlumnToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :gender
  end
end
