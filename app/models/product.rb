class Product < ApplicationRecord

  enum state: {
    on_sale: "on_sale",
    off: "off",
    purchasing: "purchasing"
  }
end
