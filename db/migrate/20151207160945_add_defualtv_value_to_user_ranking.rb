class AddDefualtvValueToUserRanking < ActiveRecord::Migration
  def change
      def up
          change_column :users, :overall_ranking, :float, default: 0
      end

        def down
          change_column :users, :overall_ranking, :float, default: nil
        end
  end
end
