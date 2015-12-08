class Badge < ActiveRecord::Base

    belongs_to :user

    # before_save :overall_ranking

    # def overall_ranking
    #     if user.badges.present?
    #         overall_ranking = 0
    #         user.badges.each do |badge|
    #             overall_ranking += badge.ranking_value
    #         end
    #         overall_ranking /= user.badges.count
    #         user.overall_ranking = overall_ranking
    #     else
    #         user.overall_ranking = ranking_value
    #     end
    #     user.save
    # end

    # def overall_ranking
    #     self.user.save
    # end

end
