class UserController < ApplicationController

    def index
        users = Users.all
        render json: users
    end

    def create
        @user = User.new(user_params)
        @user.health = 100
        @user.currency = 0
        if @user.save
            render json: {user: @user}, status: 201
        else
            render json: { error: "Username already taken" }, status: 422
        end
    end

    private 
        def user_params
            params.require(:user).permit(:username, :password)
        end

end
