class Api::V1::BadgesController < ApplicationController
    def index
        begin
            if authenticate_request!
            render(
                root: false,
                json: Badge.all,
                each_serializer: Api::V1::BadgeSerializer
            )
            end
        rescue NotAuthenticatedError #=> e e will be my error
            render(
                root: false,
                json: Badge.all,
                each_serializer: Api::V1::BadgePublicSerializer
            )
        end
    end
    def show
        if current_user.try(:id) == params[:id]
            render(
                root: false,
                json: Badge.find(params[:id]),
                serializer: Api::V1::BadgeSerializer
            )
        else
            render(
                root:false,
                json: Badge.find(params[:id]),
                serializer: Api::V1::BadgePublicSerializer
            )
        end
    end
    def create

    end


    
end
