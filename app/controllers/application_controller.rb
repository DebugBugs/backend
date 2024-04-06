class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decoded_token
        auth_header = request.headers['Authorization']
        if auth_header
            token = auth_header.split(' ')[1]
            begin 
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            puts user_id
            @user = User.find_by(id: user_id)
        end
    end

    def authorized
        unless !!current_user
            render json: { message: 'Please log in' }
        end
    end

end