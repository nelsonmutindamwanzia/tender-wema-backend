class Proposal < ApplicationRecord

    belongs_to :supplier_id
    belongs_to :tender
    has_many :proposal_scores
end
