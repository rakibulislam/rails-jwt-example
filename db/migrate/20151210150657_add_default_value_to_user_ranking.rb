class AddDefaultValueToUserRanking < ActiveRecord::Migration
  def change
    remove_column :users, :overall_ranking, :float
    add_column :users, :overall_ranking, :float, :null => false, :default => 0
  end
end
