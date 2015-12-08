class DropMovements < ActiveRecord::Migration
  def change
      drop_table :movements
  end
end
