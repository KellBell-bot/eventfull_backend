class AuthController < ApplicationController
    
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
             payload={user_id: user.id}
             token = JWT.encode(payload, 'secret')
            render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}
        else
            render json: {failure: "Log in failed. Username or password invalid."}
        end
    end

   def auto_login
        if session_user
            render json: session_user
        else
            render json: [errors: "No user Logged In"]
        end
    end

    def login_params
        params.permit(:username, :password)
    end

end