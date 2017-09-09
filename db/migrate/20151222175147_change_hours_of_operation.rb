class ChangeHoursOfOperation < ActiveRecord::Migration
  def change
    remove_column :business_hours, :day, :string
    remove_column :business_hours, :close_time, :time
    remove_column :business_hours, :open_time, :time
    add_column :business_hours, :day, :integer
    add_column :business_hours, :close_time, :integer
    add_column :business_hours, :open_time, :integer
  end
end
