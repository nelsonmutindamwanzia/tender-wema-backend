class CreateTenderers < ActiveRecord::Migration[7.0]
  def change
    create_table :tenderers do |t|

      t.timestamps
    end
  end
end
