class ProposalsController < ApplicationController

    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        render json: Proposal.all
    end

    def show
        proposal = find_proposal
        render json: proposal, include: ['suppliers', 'tenders']
    end

    def create
        proposal = Proposal.create!(proposal_params) 
        render json: proposal, status: :created
    end

    def update 
        proposal = find_proposal
        proposal.update(proposal_params)
        render json: proposal
    end

    def destroy
        proposal = find_proposal
        if proposal 
            proposal.destroy
            head :no_content
        else
            render json:{ error:"Proposal not found" }, status: :not_found
        end
    end

    private

    def find_proposal
        Proposal.find(params[:id])
    end

    def proposal_params
        params.permit(:kra_pin, :company_license, :bank_statements, :tax_compliance, :council_registration, :proposal_amount, :status, :supplier_id, :tender_id)
    end
end
