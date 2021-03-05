class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :po_number
      t.datetime :date_recieved
      t.datetime :date_delivered
      t.string :distributed_by
      t.references :purchaser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
