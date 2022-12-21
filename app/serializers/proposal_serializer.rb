class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :kra_pin, :company_license, :bank_statements, :tax_compliance, :council_registration, :proposal_amount, :status, :supplier_id, :tender_id
end
