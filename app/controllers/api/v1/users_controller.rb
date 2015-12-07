class Api::V1::UsersController < ApplicationController
    def index
        authenticate_request! #completely blocks the endpoint
        render(
            root: false,
            json: User.all,
            each_serializer: Api::V1::UserSerializer
        )
    end
    def show
        render(
            root: false,
            json: User.find(params[:id]),
            serializer: Api::V1::UserSerializer
        )
    end
    def create
        # User.create(params)
    end
end
