class AccessDeniedError < StandardError
end
class NotAuthenticatedError < StandardError
end
class NotAuthorizedError < StandardError
end
class AuthenticationTimeoutError < StandardError
end
class ApplicationController < ActionController::Base

    attr_reader :current_user
    rescue_from AuthenticationTimeoutError, with: :authentication_timeout
    rescue_from NotAuthenticatedError, with: :user_not_authenticated

    def authenticate_request!
        fail NotAuthenticatedError unless user_id_included_in_auth_token?
        @current_user = User.find(decoded_auth_token[:user_id])
        rescue JWT::ExpiredSignature
            raise AuthenticationTimeoutError
        rescue JWT::VerificationError, JWT::DecodeError
            raise NotAuthenticatedError
    end

    def authorize_request
      if params[:user_id]
        authorize_request!(params[:user_id])
      else
        authorize_request!(params[:id])
      end
    end

    def authorize_request!(id)
        fail NotAuthenticatedError unless user_id_included_in_auth_token?
        @current_user = User.find(decoded_auth_token[:user_id])
        fail NotAuthorizedError unless @current_user.id.to_s == id
        rescue JWT::ExpiredSignature
            raise AuthenticationTimeoutError
        rescue JWT::VerificationError, JWT::DecodeError
            raise NotAuthenticatedError
    end

    private
    def user_id_included_in_auth_token?
        http_auth_token && decoded_auth_token && decoded_auth_token[:user_id]
    end

    def decoded_auth_token
        @decoded_auth_token ||= AuthToken.decode(http_auth_token)
    end

    def http_auth_token
        @http_auth_token ||= if request.headers['Authorization'].present?
                                request.headers['Authorization'].split(' ').last
                             end
    end

    def authentication_timeout
        render json: { errors: ['Authentication Timeout'] }, status: 419
    end

    def forbidden_resource
        render json: { errors: ['Not Authorized To Access Resource'] }, status: :forbidden
    end

    def user_not_authenticated
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

    def resource_not_found
      render json: {message: "Not Found"}, status: :not_found
    end
end
