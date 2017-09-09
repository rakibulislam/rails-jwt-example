require "auth_token"
class AuthController < ApplicationController
  def authenticate
    user = User.find_by_credentials(params[:email], params[:password])
    if user
      render json: authentication_payload(user)
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  def reset_password
    email = params[:email]
    user = User.find_by_email(email)
    if user.send_password_reset
      render(
          json: {message: "New password was sent to: " + email}
      )
    end
  end

  private
  def authentication_payload(user)
    return nil unless user && user.id
    {
        auth_token: AuthToken.encode({ user_id: user.id }),
        user: { id: user.id, email: user.email, box_owner: user.is_box_owner?, crossfitter: user.is_crossfitter? }
    }
  end
end
