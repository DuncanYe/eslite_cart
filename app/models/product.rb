class Product < ApplicationRecord
  scope :avalible_products, -> { where(state: ["on_sale", "purchasing"])}
  validates_numericality_of :original_price, :sell_price, :sku, only_integer: true, greater_than_or_equal_to: 0
  validate :check_product_price

  enum state: {
    on_sale: "on_sale",
    discontinued: "discontinued",
    purchasing: "purchasing"
  }

  def check_product_price
    if sell_price > original_price
      errors.add(:sell_price, "售價不能高於原價")
    end
  end
end
