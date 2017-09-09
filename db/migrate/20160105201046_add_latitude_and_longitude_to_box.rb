class AddLatitudeAndLongitudeToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :latitude, :float
    add_column :boxes, :longitude, :float
  end
end
