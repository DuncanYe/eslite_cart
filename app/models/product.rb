class Product < ApplicationRecord
  scope :avalible_products, -> { where(state: ["on_sale", "purchasing"])}
  validates_numericality_of :original_price, :sell_price, only_integer: true, greater_than_or_equal_to: 0
  validate :check_product_price

  has_many :attachments, :class_name => "ProductAttachment", :dependent => :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank


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
