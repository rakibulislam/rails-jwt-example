class Api::V1::BadgesController < ApplicationController
    def update
      user = User.find(params[:id])
      badges = Badge.where(user_id: params[:id])
      badges.each do |stored_badge|
        params[:_json].each do |incoming_badge|
          if stored_badge[:name] == "Fran Time" && incoming_badge[:name] == "Fran Time"
            update_fran_time(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "500m Row Time" && incoming_badge[:name] == "500m Row Time"
            update_row_time(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "Back Squat 1RM" && incoming_badge[:name] == "Back Squat 1RM"
            update_back_squat(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "Clean and Jerk 1RM" && incoming_badge[:name] == "Clean and Jerk 1RM"
            update_clean_jerk(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "Unbroken Pull Ups" && incoming_badge[:name] == "Unbroken Pull Ups"
            update_pull_ups(stored_badge, incoming_badge, user)
          end
        end
      end


      render json: {message: "debugging"}
    end

    private

    def update_fran_time(stored_badge, incoming_badge, user)
      if incoming_badge[:value] < 600 && incoming_badge[:value] >= 420
        stored_badge.update(ranking: "Beginner", ranking_value: 1, value: incoming_badge[:value])
      elsif incoming_badge[:value] < 420 && incoming_badge[:value] >= 300
        stored_badge.update(ranking: "Intermediate", ranking_value: 2, value: incoming_badge[:value])
      elsif incoming_badge[:value] < 300 && incoming_badge[:value] >= 180
        stored_badge.update(ranking: "RX", ranking_value: 3, value: incoming_badge[:value])
      elsif incoming_badge[:value] < 180
        stored_badge.update(ranking: "Elite", ranking_value: 4, value: incoming_badge[:value])
      else
        stored_badge.update(ranking: "Unranked", ranking_value: 0, value: incoming_badge[:value])
      end
    end

    def update_row_time(stored_badge, incoming_badge, user)
      if user[:gender] == "Male"
        if incoming_badge[:value] < 180 && incoming_badge[:value] >= 120
          stored_badge.update(ranking: "Beginner", ranking_value: 1)
        elsif incoming_badge[:value] < 120 && incoming_badge[:value] >= 105
          stored_badge.update(ranking: "Intermediate", ranking_value: 2)
        elsif incoming_badge[:value] < 105 && incoming_badge[:value] >= 90
          stored_badge.update(ranking: "RX", ranking_value: 3)
        elsif incoming_badge[:value] < 90
          stored_badge.update(ranking: "Elite", ranking_value: 4)
        else
          stored_badge.update(ranking: "Unranked", ranking_value: 0)
        end
      else #logic for Female Crossfitter
        if incoming_badge[:value] < 210 && incoming_badge[:value] >= 150
          stored_badge.update(ranking: "Beginner", ranking_value: 1)
        elsif incoming_badge[:value] < 150 && incoming_badge[:value] >= 120
          stored_badge.update(ranking: "Intermediate", ranking_value: 2)
        elsif incoming_badge[:value] < 120 && incoming_badge[:value] >= 95
          stored_badge.update(ranking: "RX", ranking_value: 3)
        elsif incoming_badge[:value] < 95
          stored_badge.update(ranking: "Elite", ranking_value: 4)
        else
          stored_badge.update(ranking: "Unranked", ranking_value: 0)
        end
      end
    end

    def update_back_squat(stored_badge, incoming_badge, user)
      if user[:gender] == "Male"
        if incoming_badge[:value] < 135 && incoming_badge[:value] >= 0
          stored_badge.update(ranking: "Beginner", ranking_value: 1)
        elsif incoming_badge[:value] < 205 && incoming_badge[:value] >= 135
          stored_badge.update(ranking: "Intermediate", ranking_value: 2)
        elsif incoming_badge[:value] < 315 && incoming_badge[:value] >= 135
          stored_badge.update(ranking: "RX", ranking_value: 3)
        elsif incoming_badge[:value] >= 315
          stored_badge.update(ranking: "Elite", ranking_value: 4)
        else
          stored_badge.update(ranking: "Unranked", ranking_value: 0)
        end
      else #logic for Female Crossfitter
        if incoming_badge[:value] < 75 && incoming_badge[:value] >= 0
          stored_badge.update(ranking: "Beginner", ranking_value: 1)
        elsif incoming_badge[:value] < 135 && incoming_badge[:value] >= 75
          stored_badge.update(ranking: "Intermediate", ranking_value: 2)
        elsif incoming_badge[:value] < 165 && incoming_badge[:value] >= 135
          stored_badge.update(ranking: "RX", ranking_value: 3)
        elsif incoming_badge[:value] > 165
          stored_badge.update(ranking: "Elite", ranking_value: 4)
        else
          stored_badge.update(ranking: "Unranked", ranking_value: 0)
        end
      end
    end

    def update_clean_jerk(stored_badge, incoming_badge, user)
      if user[:gender] == "Male"
        if incoming_badge[:value] < 135 && incoming_badge[:value] >= 0
          stored_badge.update(ranking: "Beginner", ranking_value: 1)
        elsif incoming_badge[:value] < 195 && incoming_badge[:value] >= 135
          stored_badge.update(ranking: "Intermediate", ranking_value: 2)
        elsif incoming_badge[:value] < 245 && incoming_badge[:value] >= 195
          stored_badge.update(ranking: "RX", ranking_value: 3)
        elsif incoming_badge[:value] >= 245
          stored_badge.update(ranking: "Elite", ranking_value: 4)
        else
          stored_badge.update(ranking: "Unranked", ranking_value: 0)
        end
      else #logic for Female Crossfitter
        if incoming_badge[:value] < 75 && incoming_badge[:value] >= 0
          stored_badge.update(ranking: "Beginner", ranking_value: 1)
        elsif incoming_badge[:value] < 115 && incoming_badge[:value] >= 75
          stored_badge.update(ranking: "Intermediate", ranking_value: 2)
        elsif incoming_badge[:value] < 145 && incoming_badge[:value] >= 115
          stored_badge.update(ranking: "RX", ranking_value: 3)
        elsif incoming_badge[:value] > 145
          stored_badge.update(ranking: "Elite", ranking_value: 4)
        else
          stored_badge.update(ranking: "Unranked", ranking_value: 0)
        end
      end
    end

    def update_pull_ups(stored_badge, incoming_badge, user)
      if incoming_badge[:value] < 5 && incoming_badge[:value] >= 0
        stored_badge.update(ranking: "Beginner", ranking_value: 1, value: incoming_badge[:value])
      elsif incoming_badge[:value] < 10 && incoming_badge[:value] >= 5
        stored_badge.update(ranking: "Intermediate", ranking_value: 2, value: incoming_badge[:value])
      elsif incoming_badge[:value] < 20 && incoming_badge[:value] >= 10
        stored_badge.update(ranking: "RX", ranking_value: 3, value: incoming_badge[:value])
      elsif incoming_badge[:value] < 20
        stored_badge.update(ranking: "Elite", ranking_value: 4, value: incoming_badge[:value])
      else
        stored_badge.update(ranking: "Unranked", ranking_value: 0, value: incoming_badge[:value])
      end
    end

end
