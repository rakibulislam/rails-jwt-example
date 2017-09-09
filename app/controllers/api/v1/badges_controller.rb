class Api::V1::BadgesController < ApplicationController
    def update
      user = User.find(params[:id])
      badges = Badge.where(user_id: params[:id])
      badges.each do |stored_badge|
        badge_params[:badges].each do |incoming_badge|
          if stored_badge[:name] == "Fran Time" && incoming_badge[:name] == "Fran Time"
            Api::V1::RankMovementService.update_fran_time(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "500m Row Time" && incoming_badge[:name] == "500m Row Time"
            Api::V1::RankMovementService.update_row_time(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "Back Squat 1RM" && incoming_badge[:name] == "Back Squat 1RM"
            Api::V1::RankMovementService.update_back_squat(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "Clean and Jerk 1RM" && incoming_badge[:name] == "Clean and Jerk 1RM"
            Api::V1::RankMovementService.update_clean_jerk(stored_badge, incoming_badge, user)
          elsif stored_badge[:name] == "Unbroken Pull Ups" && incoming_badge[:name] == "Unbroken Pull Ups"
            Api::V1::RankMovementService.update_pull_ups(stored_badge, incoming_badge, user)
          end
        end
      end
      user.calc_overall_ranking
      render(
          root: false,
          status: :ok,
          json: user,
          serializer: Api::V1::UserSerializer
      )

    end

    private
    def badge_params
      params.permit(:id, :badges => [:name, :value])
    end

end
