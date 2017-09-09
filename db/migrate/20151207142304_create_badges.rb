class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.string :ranking
      t.integer :ranking_value
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
