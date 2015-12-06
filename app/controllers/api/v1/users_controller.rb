class Api::V1::UsersController < ApplicationController
    def index
        render(
            root: false,
            json: User.all,
            each_serializer: ::UserSerializer
        )
    end
    def show

    end
end
