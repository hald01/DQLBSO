class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :total_cost
      t.string :books, array: true, default: []
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
