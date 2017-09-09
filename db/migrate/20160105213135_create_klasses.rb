class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.integer :box_id, :null => false
      t.string :day, :null => false
      t.integer :start_time, :null => false
      t.integer :end_time, :null => false
      t.string :description
      t.string :name, :null => false

      t.timestamps null: false
    end
  end
end
