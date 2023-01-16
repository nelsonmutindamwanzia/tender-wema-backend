class SessionsController < ApplicationController
    def create
        supplier = Supplier.find_by(email: params[:email])
        if supplier&.authenticate(params[:password])
            # session[:supplier_id] = user.id
            # render json: user, status: :created
            token = encode_token(supplier_id: supplier.id)
            render json: { supplier: SupplierSerializer.new(supplier), jwt: token }, status: :created

        else
            render json: { errors: ["Invalid email or password"] }, status: :unauthorized
        end
    end

    def destroy
        session.delete :supplier_id
        head :no_content
    end
end

