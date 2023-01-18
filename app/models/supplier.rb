class Supplier < ApplicationRecord

    has_secure_password
    
    has_many :proposals
    has_many :proposal_scores
end
