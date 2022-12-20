class Tender < ApplicationRecord

    belongs_to :tenderer
    has_many :proposals

end
