class Tender < ApplicationRecord

    belongs_to :tenderer
    has_many :proposals
    has_many :proposal_scores

end
