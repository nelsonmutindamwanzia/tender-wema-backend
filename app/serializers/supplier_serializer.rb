class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :email, :company_name, :company_address, :company_telephone

  has_many :proposals
  has_many :proposal_scores 
end
