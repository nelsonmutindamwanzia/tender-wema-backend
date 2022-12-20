class CreateProposalScores < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_scores do |t|

      t.timestamps
    end
  end
end
