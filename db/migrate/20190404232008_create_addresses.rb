class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :location
      t.decimal :latitude
      t.decimal :longitude
      t.integer :user_id

      t.timestamps
    end
  end
end
