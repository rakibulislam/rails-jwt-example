class AddStateToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :state, :string
  end
end
