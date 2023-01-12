class SessionsController < ApplicationController
    def create
        user = Supplier.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:supplier_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Invalid email or password"] }, status: :unauthorized
        end
    end

    def destroy
        session.delete :supplier_id
        head :no_content
    end
end

