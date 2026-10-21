class UsersController < ApplicationController
    
    # GET /users
    # Display all users without exposing password hashes
    def index
        users = User.select(
          :UserID,
          :FullName,
          :UserName,
          :Role,
          :IsActive,
          :CreatedAt

          
        )

        render json: users
    end


    # GET /users/search_by_role?Role=Cashier
    # Search users by role
    def search_by_role
      users = User.select(
        :UserID,
        :FullName,
        :UserName,
        :Role,
        :IsActive,
        :CreatedAt
      ).where(Role: params[:Role])

      render json: users
    end


    # POST /users
    # Create a new user account
    def create
      user = User.new(
        FullName: params[:FullName],
        UserName: params[:UserName],
        Role: params[:Role],
        IsActive: true,
        CreatedAt: Time.current
      )

      user.password = params[:Password]

      if user.save
        render json: {
          message: "User created successfully",
          user: {
            UserID: user.UserID,
            FullName: user.FullName,
            UserName: user.UserName,
            Role: user.Role,
            IsActive: user.IsActive
          }
        }, status: :created
      else
        render json: {
          errors: user.errors.full_messages
        }, status: :unprocessable_entity
      end
    end


    # GET /users/:id
    # Display one user by ID
    def show
      user = User.select(
        :UserID,
        :FullName,
        :UserName,
        :Role,
        :IsActive,
        :CreatedAt
      ).find_by(UserID: params[:id])

      if user
        render json: user
      else
        render json: {
          message: "User not found"
        }, status: :not_found
      end
    end


    # PATCH /users/:id
    # Update account details
    def update
      user = User.find_by(UserID: params[:id])

      if user.nil?
        render json: {
          message: "User not found"
        }, status: :not_found

        return
      end

      if user.update(
        FullName: params[:FullName],
        UserName: params[:UserName],
        Role: params[:Role],
        IsActive: params[:IsActive]
      )
        render json: {
          message: "User updated successfully",
          user: {
            UserID: user.UserID,
            FullName: user.FullName,
            UserName: user.UserName,
            Role: user.Role,
            IsActive: user.IsActive
          }
        }, status: :ok
      else
        render json: {
          errors: user.errors.full_messages
        }, status: :unprocessable_entity
      end
    end


    # PATCH /users/:id/change_password
    # Change a user's password
    def change_password
      user = User.find_by(UserID: params[:id])

      if user.nil?
        render json: {
          message: "User not found"
        }, status: :not_found

        return
      end

      user.password = params[:Password]

      if user.save
        render json: {
          message: "Password changed successfully"
        }, status: :ok
      else
        render json: {
          errors: user.errors.full_messages
        }, status: :unprocessable_entity
      end
    end

    #login

    def login
          user = User.find_by(UserName: params[:UserName])

          if user && user.authenticate(params[:Password])
              render json:
              {
                  message: "Successfull"
              }, status: :ok

          else
              render json:
              {
                  message: "Invalid Username and Password."
              }, status: :unauthorized
          end


      end
end


