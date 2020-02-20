class ChangeProductSkuType < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :sku, :string
  end
end
