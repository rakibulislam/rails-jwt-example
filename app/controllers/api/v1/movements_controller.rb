class Api::V1::MovementsController < ApplicationController
    def index
        render(
            root: false,
            json: Movement.all,
            each_serializer: Api::V1::MovementSerializer
        )
    end
    def show
        render(
            root: false,
            json: Movement.find(params[:id]),
            serializer: Api::V1::MovementSerializer
        )
    end
end
