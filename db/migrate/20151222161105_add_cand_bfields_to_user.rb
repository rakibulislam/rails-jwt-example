class AddCandBfieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_crossfitter, :boolean
    add_column :users, :is_box_owner, :boolean
  end
end
