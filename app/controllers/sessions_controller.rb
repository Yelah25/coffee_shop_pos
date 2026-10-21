class SessionsController < ApplicationController
    
    def create
        user = User.find_by(UserName: params[:UserName])

        if user.IsActive && user.authenticate(params[:Password])
            reset_session
            session[:userid] = user.UserID

            render json:{
                message: "Login successfully.",
                user:{
                    UserID: user.UserID,
                    FullName: user.FullName,
                    Role: user.Role
                }
            }, status: :ok

        else
            render json: {
                message: "Invalid username or password."
            }, status: :unauthorized
         end
    end

    def destroy
        reset_session

        render json:
        {
            message"Logout successfully."
        }
    
    end 


end
