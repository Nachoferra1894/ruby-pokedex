class UsersController < ApplicationController
    def create
        @user = User.create(user_params)

        if @user.valid?
            token = encode_token(@user.id)
            render json: { user: @user, jwt: token }, status: :created
        else
            render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by(username: params[:username])

        if @user.authenticate(params[:password])
            token = encode_token(@user.id)
            render json: { user: @user, jwt: token }, status: :ok
        else
            render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
        end
    end

    private 
    
    def user_params
        params.permit(:username, :password)
    end
end
