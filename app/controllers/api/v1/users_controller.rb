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
        user = User.create(user_params)
            render(
                root: false,
                json: user,
                serializer: Api::V1::UserSerializer
            )
    end

    private
    def user_params
        params.permit(:first_name, :last_name, :email, :phone, :home_gym, :password, :password_confirmation)
    end


end
