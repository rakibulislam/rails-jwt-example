class RemoveRankingValueFromBadge < ActiveRecord::Migration
  def change
    remove_column :badges, :ranking_value
  end
end
