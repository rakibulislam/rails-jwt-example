class Api::V1::UsersController < ApplicationController
    def index
        # authenticate_request! #completely blocks the endpoint if not authenticated
        render(
            root: false,
            status: :ok,
            json: User.all,
            each_serializer: Api::V1::UserSerializer
        )
    end

    def show
      begin
        user = User.find(params[:id])
          render(
              root: false,
              status: :ok,
              json: user,
              serializer: Api::V1::UserSerializer
          )
      rescue ActiveRecord::RecordNotFound
        resource_not_found
      end
    end

    def create
      user = User.create(user_params)
          render(
              root: false,
              json: user,
              serializer: Api::V1::UserSerializer
          )
    end

    def update
      begin
        authorize_request!
          user = User.find(params[:id])
          user.update(user_params)
          render(
            root: false,
            status: :ok,
            json: user,
            serializer: Api::V1::UserSerializer
          )
      rescue NotAuthenticatedError
        user_not_authenticated
      rescue NotAuthorizedError
        forbidden_resource
      rescue AuthenticationTimeoutError
        authentication_timeout
      rescue RecordNotFound
        resource_not_found
      end
    end

    def destroy
      begin
        authorize_request!
          user = User.find(params[:id])
            user.delete
            Badge.destroy_all(user_id: params[:id])
            render(
              root: false,
              status: :ok,
              json: {message: "Removed"},
          )
      rescue NotAuthenticatedError
        user_not_authenticated
      rescue NotAuthorizedError
        forbidden_resource
      rescue AuthenticationTimeoutError
        authentication_timeout
      rescue RecordNotFound
        resource_not_found
      end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :phone, :home_gym, :password)
    end


end
