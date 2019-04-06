class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :date_time
      t.string :address_id
      t.decimal :tax
      t.decimal :total
      t.decimal :discount
    end
  end
end
