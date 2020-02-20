class Product < ApplicationRecord
  scope :avalible_products, -> { where(state: ["on_sale", "purchasing"])}
  validates_numericality_of :original_price, :sell_price, :sku, only_integer: true, greater_than_or_equal_to: 0

  enum state: {
    on_sale: "on_sale",
    discontinued: "discontinued",
    purchasing: "purchasing"
  }
end
