class CreateProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :proposals do |t|

      t.string :kra_pin
      t.text :company_license
      t.text :bank_statements
      t.text :tax_compliance
      t.text :council_registration
      t.integer :proposal_amount
      t.boolean :status
      t.integer :supplier_id
      t.integer :tender_id

      t.timestamps
    end
  end
end
