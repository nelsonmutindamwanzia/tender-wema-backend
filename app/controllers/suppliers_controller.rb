class SuppliersController < ApplicationController
    # before_action :authorize, only: [:show]
    skip_before_action :authorized, only: [:create, :index, :show]

    def create 
        supplier = Supplier.create(supplier_params)
        if supplier.valid?
            token = encode_token(supplier_id: supplier.id)
            render json: { supplier: SupplierSerializer.new(supplier), jwt: token }, status: :created
        else 
            render json: { error: 'Failed to create Supplier' }, status: :unprocessable_entity
        end
    end

    def show
        supplier = find_supplier
        render json: supplier, status: :ok
    end

    def index
        render json: Supplier.all
    end

    def profile
        render json: @supplier
    end

    private

    def supplier_params
        params.require(:supplier).permit( :email, :password, :password_confirmation, :company_name, :company_address, :company_telephone)
        #params.permit( :email, :password, :password_confirmation, :company_name, :company_address, :company_telephone)
    end

    def find_supplier
        Supplier.find(params[:id])
    end
end
