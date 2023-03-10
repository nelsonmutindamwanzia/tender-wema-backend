class ApplicationController < ActionController::API

    before_action :authorized

    include ActionController::Cookies

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t')
    end

    def auth_header
        # { Authorization: 'Bearer <token' }
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
            rescue
                nil
            end
        end

    end

    def current_user
        if decoded_token
            supplier_id = decoded_token[0]['supplier_id']
            @supplier = Supplier.find_by(id: supplier_id)
        end
    end

    def current_user_tenderer
        if decoded_token
            tenderer_id = decoded_token[0]['tenderer_id']
            @tenderer = Tenderer.find_by(id: tenderer_id)
        end
    end

    def logged_in?
        !!current_user
        !!current_user_tenderer
    end

    def authorized
        if logged_in?
            true
        else
            render json: { message: 'Please log in' }, status: :unauthorized
        end
    end
end
