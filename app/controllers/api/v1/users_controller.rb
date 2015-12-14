class Api::V1::UsersController < ApplicationController
    def index
        # authenticate_request! #completely blocks the endpoint if not authenticated
        render(
            root: false,
            json: User.all,
            each_serializer: Api::V1::UserSerializer
        )
    end

    def show
      begin
        user = User.find(params[:id])
          render(
              root: false,
              json: user,
              serializer: Api::V1::UserSerializer
          )
      rescue ActiveRecord::RecordNotFound
        render(
          root: false,
          status: 404,
          json: {message: "Not Found"}
        )
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
          if authenticate_request!
            if current_user.id.to_s == params[:id]
              begin
                user = User.find(params[:id])
                user.update(user_params)
                render(
                    root: false,
                    status: 201,
                    json: user,
                    serializer: Api::V1::UserSerializer
                )
              rescue ActiveRecord::RecordNotFound
                render(
                  root: false,
                  status: 404,
                  json: {message: "Not Found"}
                )
              end
            else
              render(
                  root: false,
                  status: 403,
                  json: {message: "Not Authorized"},
              )
            end
          end
      rescue NotAuthenticatedError #=> e e will be my error
          render(
              root: false,
              status: 403,
              json: {message: "Not Authenticated"},
          )
      end
    end

    def destroy
      begin
          if authenticate_request!
            if current_user.id.to_s == params[:id]
              begin
                user = User.find(params[:id])
                  user.delete
                  Badge.destroy_all(user_id: params[:id])
                  render(
                      root: false,
                      status: 403,
                      json: {message: "Removed"},
                  )
              rescue ActiveRecord::RecordNotFound
                render(
                  root: false,
                  status: 404,
                  json: {message: "Not Found"}
                )
              end
            else
              render(
                  root: false,
                  status: 403,
                  json: {message: "Not Authorized"},
              )
            end
          end
      rescue NotAuthenticatedError #=> e e will be my error
          render(
              root: false,
              status: 403,
              json: {message: "Not Authenticated"},
          )
      end
    end

    private
    def user_params
        params.permit(:first_name, :last_name, :email, :phone, :home_gym, :password)
    end


end
