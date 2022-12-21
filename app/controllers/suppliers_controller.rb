class SuppliersController < ApplicationController
    before_action :authorize, only: [:show]

    def create 
        supplier = Supplier.create(supplier_params)
        session[:supplier_id] = supplier.id
        if supplier.valid?
            render json: supplier, status: :created
        else 
            render json: {error: supplier.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        supplier = Supplier.find_by(id: session[:supplier_id])
        render json: supplier
    end

    def index
        render json: Supplier.all
    end

    private

    def supplier_params
        params.permit( :email, :password, :password_confirmation, :company_name, :company_address, :company_telephone)
    end

    def authorize 
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :supplier_id
    end
end
