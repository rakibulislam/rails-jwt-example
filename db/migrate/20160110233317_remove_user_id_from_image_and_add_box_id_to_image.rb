class RemoveUserIdFromImageAndAddBoxIdToImage < ActiveRecord::Migration
  def change
    remove_column :images, :user_id, :integer
    add_column :images, :box_id, :integer
  end
end
