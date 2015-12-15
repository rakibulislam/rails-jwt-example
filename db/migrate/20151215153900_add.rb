class Add < ActiveRecord::Migration
  def change
    add_column :badges, :ranking_value, :int
  end
end
