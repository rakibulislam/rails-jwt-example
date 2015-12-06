class Movement < ActiveRecord::Base

    belongs_to :user

    before_save :overall_ranking

    def overall_ranking
        if user.movements.present?
            overall_ranking = 0
            user.movements.each do |movement|
                overall_ranking += movement.ranking_value
            end
            overall_ranking /= user.movements.count
            user.overall_ranking = overall_ranking
        else
            user.overall_ranking = 0
        end
        user.save
    end

end
