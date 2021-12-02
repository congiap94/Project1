class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :gender
      t.string :phone
      t.integer :office_id

      t.timestamps
    end
  end
end
