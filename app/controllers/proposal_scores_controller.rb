class ProposalScoresController < ApplicationController
    
    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        render json: ProposalScore.all
    end

    def show
        proposal_score = find_proposal_score
        render json: proposal_score
    end

    def create
        proposal_score = ProposalScore.create!(proposal_score_params) 
        render json: proposal_score, status: :created
    end

    def update 
        proposal_score = find_proposal_score
        proposal_score.update(proposal_score_params)
        render json: proposal_score
    end

    def destroy
        proposal_score = find_proposal_score
        if proposal_score 
            proposal_score.destroy
            head :no_content
        else
            render json:{ error:"ProposalScore not found" }, status: :not_found
        end
    end

    private

    def find_proposal_score
        ProposalScore.find(params[:id])
    end

    def proposal_score_params
        params.permit(:quality, :maintenance, :completion_period, :price, :proposal_id 
        )
    end
end
