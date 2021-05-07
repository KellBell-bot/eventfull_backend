class AuthController < ApplicationController
    
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
             payload={user_id: user.id}
             token = JWT.encode(payload, 'secret')
            render json: {user: user, include: :events, jwt: token, success: "Welcome back, #{user.username}"}
        else
            render json: {failure: "Log in failed. Username or password invalid."}
        end
    end




    def auto_login
        if request.headers["Authorization"]
            encoded_token = request.headers["Authorization"].split(' ')[1]
            decoded_hash= JWT.decode(encoded_token, 'secret')
            user_id = decoded_hash[0]['user_id']
            user = User.find_by(id: user_id)
            render json: {user: user, events: user.events, success: "Hi #{user.username}"}
        else
            byebug
            render json: {failure: "Auto login failed"}
        end
    end

        
    private    
    def login_params
            params.permit(:username, :password, relationships: [:events])
    end

end