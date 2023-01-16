class TenderersController < ApplicationController
        # before_action :authorize, only: [:show]
        skip_before_action :authorized, only: [:create, :index, :show]
    
        def create 
            tenderer = Tenderer.create(tenderer_params)
            session[:tenderer_id] = tenderer.id
            if tenderer.valid?
                render json: tenderer, status: :created
            else 
                render json: {error: tenderer.errors.full_messages}, status: :unprocessable_entity
            end
        end
    
        def show
            tenderer = find_tenderer
            render json: tenderer, status: :ok
        end
    
        def index
            render json: Tenderer.all
        end
    
        private
    
        def tenderer_params
            params.permit( :email, :password, :password_confirmation, :company_name, :company_address, :company_telephone)
        end
    
        def find_tenderer
            Tenderer.find(params[:id])
        end
end
