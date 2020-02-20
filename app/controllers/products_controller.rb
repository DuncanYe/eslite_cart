class ProductsController < ApplicationController
  def index
    @products = Product.avalible_products
  end
end
