class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :state
      t.text :desc
      t.integer :sku
      t.integer :category_id
      t.integer :original_price, comment: "原價"
      t.integer :sell_price, comment: "售價"

      t.timestamps
    end
  end
end
