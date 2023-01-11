class TendersController < ApplicationController
    def index
        render json: Tender.all
    end

    def show
        tender = find_tender
        render json: tender
    end

    def create
        tender = Tender.create!(tender_params) 
        render json: tender, status: :created
    end

    def update 
        tender = find_tender
        tender.update(tender_params)
        render json: tender
    end

    def destroy
        tender = find_tender
        if tender 
            tender.destroy
            head :no_content
        else
            render json:{ error:"Tender not found" }, status: :not_found
        end
    end

    private

    def find_tender
        Tender.find(params[:id])
    end

    def tender_params
        params.permit(:tender_name, :tender_category, :tender_description, :timeline, :application_deadline, :budget, :tenderer_id)
    end
end
