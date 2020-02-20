class Product < ApplicationRecord
  scope :avalible_products, -> { where(state: ["on_sale", "purchasing"])}

  enum state: {
    on_sale: "on_sale",
    off: "off",
    purchasing: "purchasing"
  }
end
