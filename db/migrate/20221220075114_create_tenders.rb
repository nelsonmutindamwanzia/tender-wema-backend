class CreateTenders < ActiveRecord::Migration[7.0]
  def change
    create_table :tenders do |t|

      t.timestamps
    end
  end
end