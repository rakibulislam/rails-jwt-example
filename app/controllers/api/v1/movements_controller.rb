class Api::V1::MovementsController < ApplicationController
    def index
        begin
            if authenticate_request!
            render(
                root: false,
                json: Movement.all,
                each_serializer: Api::V1::MovementSerializer
            )
            end
        rescue NotAuthenticatedError #=> e e will be my error
            render(
                root: false,
                json: Movement.all,
                each_serializer: Api::V1::MovementPublicSerializer
            )
        end
    end
    def show
        if current_user.try(:id) == params[:id]
            render(
                root: false,
                json: Movement.find(params[:id]),
                serializer: Api::V1::MovementSerializer
            )
        else
            render(
                root:false,
                json: Movement.find(params[:id]),
                serializer: Api::V1::MovementPublicSerializer
            )
        end
    end
    def create

    end

    
end
