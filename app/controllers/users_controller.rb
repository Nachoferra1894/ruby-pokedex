class UsersController < ApplicationController
    def create
        @user = User.create(user_params)

        if @user.valid?
            token = encode_token(@user.id)
            render json: { user: @user, jwt: token }, status: :created
        else
            if @user.errors.any?
                render json: @user.errors, status: :unprocessable_entity
            else
                render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
            end
        end
    end

    def login
        @user = User.find_by(username: user_params[:username])

        if @user.nil?
            render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
        end

        if @user.authenticate(user_params[:password])
            token = encode_token(@user.id)
            render json: { user: @user, jwt: token }, status: :ok
        else
            if @user.errors.any?
                render json: @user.errors, status: :unprocessable_entity
            else
                render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
            end
        end
    end

    private 
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
