class Proposal < ApplicationRecord

    belongs_to :supplier
    belongs_to :tender
    has_many :proposal_scores
end
