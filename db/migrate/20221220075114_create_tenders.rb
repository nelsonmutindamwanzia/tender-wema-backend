class CreateTenders < ActiveRecord::Migration[7.0]
  def change
    create_table :tenders do |t|

      t.string :tender_name
      t.string :tender_category
      t.string :tender_description
      t.datetime :timeline
      t.datetime :application_deadline
      t.integer :budget
      t.integer :tenderer_id

      t.timestamps
    end
  end
end
