class Badge < ActiveRecord::Base

    belongs_to :user

    # after_save :user_calc_overall_ranking


    

    private
    # def user_calc_overall_ranking
    #     sum = 0
    #     user.badges.each do |badge|
    #       sum += badge.ranking_value
    #     end
    #     binding.pry
    #     user.overall_ranking = sum / user.badges.count
    #     user.save
    # end

end
