class Defualtvalueusers < ActiveRecord::Migration
  def change
      remove_column :users, :overall_ranking
  end
end
