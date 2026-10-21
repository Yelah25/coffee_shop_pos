
class ApplicationController < ActionController::API
    private

    def current_user
        return @current_user if defined?(@current_user)

        @current_user = User.find_by(UserID: session[:user_id]) if session[:user_id]
    end

    def authenticate_user!
        unless current_user&.IsActive
        render json: {
            message: "Unauthorized"
        }, status: :unauthorized
        end
    end

    

end
