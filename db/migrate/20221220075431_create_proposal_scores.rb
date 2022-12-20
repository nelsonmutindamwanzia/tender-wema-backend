class CreateProposalScores < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_scores do |t|

      t.integer :quality
      t.integer :maintenance
      t.integer :completion_period
      t.integer :price
      t.integer :proposal_id

      t.timestamps
    end
  end
end
