class TenderersController < ApplicationController
    # before_action :authorize, only: [:show]
    skip_before_action :authorized, only: [:create, :index, :show]

    def create 
        tenderer = Tenderer.create(tenderer_params)
        if tenderer.valid?
            token = encode_token(tenderer_id: tenderer.id)
            render json: { tenderer: TendererSerializer.new(tenderer), jwt: token }, status: :created
        else 
            render json: { error: 'Failed to create Tenderer' }, status: :unprocessable_entity
        end
    end

    def show
        tenderer = find_tenderer
        render json: tenderer, status: :ok
    end

    def index
        render json: Tenderer.all
    end

    def tenderer_profile
        render json: @tenderer
    end

    private

    def tenderer_params
        params.require(:tenderer).permit( :email, :password, :password_confirmation)
        # params.permit( :email, :password, :password_confirmation, :company_name, :company_address, :company_telephone)
    end

    def find_tenderer
        Tenderer.find(params[:id])
    end

end