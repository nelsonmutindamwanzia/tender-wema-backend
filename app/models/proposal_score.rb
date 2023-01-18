class ProposalScore < ApplicationRecord
    
    belongs_to :proposal
    belongs_to :supplier
    belongs_to :tender
end
