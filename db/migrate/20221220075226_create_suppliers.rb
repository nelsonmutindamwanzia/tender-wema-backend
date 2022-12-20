class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|

      t.string :email
      t.string :password_digest
      t.string :company_name
      t.string :company_address
      t.string :company_telephone

      t.timestamps
    end
  end
end
