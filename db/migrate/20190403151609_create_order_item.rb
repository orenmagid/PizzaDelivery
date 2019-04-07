class CreateOrderItem < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :pizza_type_id
      t.integer :order_id
      t.integer :quantity
    end
  end
end