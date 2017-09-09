class AddOverallRankingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :overall_ranking, :float
  end
end
