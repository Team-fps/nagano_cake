class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :price_tax
      t.integer :count
      t.integer :production_status, default: 0, null: 0

      t.timestamps
    end
  end
end
