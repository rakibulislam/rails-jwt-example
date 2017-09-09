class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.string :day, :null => false
      t.integer :box_id, :null =>false
      t.time :close_time
      t.time :open_time

      t.timestamps null: false
    end
  end
end
