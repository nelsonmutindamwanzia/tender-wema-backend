class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        @supplier = Supplier.find_by(email: login_params[:email])
        if @supplier && @supplier.authenticate(login_params[:password])
            token = encode_token(supplier_id: @supplier.id)
            render json: { supplier: SupplierSerializer.new(@supplier), jwt: token }, status: :accepted
        else
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end 

    private

    def login_params
        params.require(:supplier).permit(:email, :password)
    end
end
