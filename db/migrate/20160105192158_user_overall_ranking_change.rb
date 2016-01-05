class UserOverallRankingChange < ActiveRecord::Migration
  def change
    remove_column :users, :overall_ranking, :float
    add_column :users, :overall_ranking, :string
    add_column :users, :overall_ranking_value, :float, :default => 0
  end
end
