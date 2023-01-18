class AddTenderIdAndSupplierIdToProposalScores < ActiveRecord::Migration[7.0]
  def change
    add_column :proposal_scores, :tender_id, :integer
    add_column :proposal_scores, :supplier_id, :integer
  end
end
