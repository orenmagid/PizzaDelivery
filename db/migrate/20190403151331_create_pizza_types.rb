class CreatePizzaTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pizza_types do |t|
      t.string :name
      t.integer :price
    end
  end
end
