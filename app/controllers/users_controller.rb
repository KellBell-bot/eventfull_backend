class UsersController < ApplicationController

    def index
        users= User.all
        render json: users, include: :events
    end

    def show
        user= User.find(params[:id])
        render json: user
    end

    def create 
        user= User.create(user_params)
        if user.valid?
            payload={user_id: user.id}
            token = JWT.encode(payload, 'secret')
            render json: {user: user, jwt: token} 
            render json: {error: user.errors.full_messages}, status: :not_acceptable
        end
    end

    def update 
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destory
        user= User.find(params[:id])
        user.destroy
    end

    private

    def user_params
        params.permit(:full_name, :username, :password, relationships: [:events])
    end
end
