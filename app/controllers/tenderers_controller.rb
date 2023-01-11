class TenderersController < ApplicationController
        before_action :authorize, only: [:show]
    
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
            tenderer = Tenderer.find_by(id: session[:tenderer_id])
            render json: tenderer
        end
    
        def index
            render json: Tenderer.all
        end
    
        private
    
        def tenderer_params
            params.permit( :email, :password, :password_confirmation, :company_name, :company_address, :company_telephone)
        end
    
        def authorize 
            return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :tenderer_id
        end
    
end
