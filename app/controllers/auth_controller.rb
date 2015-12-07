require "auth_token"
class AuthController < ApplicationController
  def authenticate
    user = User.find_by_credentials(params[:email], params[:name])
    if user
      render json: authentication_payload(user)
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  private
  def authentication_payload(user)
    return nil unless user && user.id
    {
        auth_token: AuthToken.encode({ user_id: user.id }),
        user: { id: user.id, email: user.email }
    }
  end
end
