class ProposalScoreSerializer < ActiveModel::Serializer
  attributes :id, :quality, :maintenance, :completion_period, :price, :proposal_id 
end
