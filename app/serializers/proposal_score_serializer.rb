class ProposalScoreSerializer < ActiveModel::Serializer
  attributes :id, :quality, :maintenance, :completion_period, :price, :proposal_id 

  belongs_to :proposal
  belongs_to :supplier
  belongs_to :tender
end
