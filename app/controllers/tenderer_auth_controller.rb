class TendererAuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        @tenderer = Tenderer.find_by(email: login_params[:email])
        if @tenderer && @tenderer.authenticate(login_params[:password])
            token = encode_token(tenderer_id: @tenderer.id)
            render json: { tenderer: TendererSerializer.new(@tenderer), jwt: token }, status: :accepted
        else
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end 

    private

    def login_params
        params.require(:tenderer).permit(:email, :password)
    end

end