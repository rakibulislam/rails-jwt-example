class Defualtvalueusersadd < ActiveRecord::Migration
  def change
      add_column :users, :overall_ranking, :float, defualt: 0.0
  end
end
