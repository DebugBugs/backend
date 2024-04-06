class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login]

    def index
        users = User.all
        render json: users
    end

    def show
        begin
            @user = User.find(params[:id])
            render json: {user: @user}
        rescue 
            render json: {error: 'User not found'}
        end 
    end

    def destroy
        begin
            @user = User.find(params[:id])
            @user.destroy
        rescue 
            render json: {error: 'User not found'}
        end 
    end

    #route for signup
    def create
        @user = User.new(user_params)
        @user.health = 100
        @user.currency = 0
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: 201
        else
            render json: { error: "Username already taken" }, status: 422
        end
    end

    #route for login
    def login
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.password == params[:user][:password]
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else 
            render json: { error: "Invalid username or password" }, status: 422
        end
    end

    private 
        def user_params
            params.require(:user).permit(:username, :password)
        end

end