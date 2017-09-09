class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :unit
      t.string :city
      t.string :zip
      t.integer :user_id, :null => false

      t.timestamps null: false
    end
  end
end
