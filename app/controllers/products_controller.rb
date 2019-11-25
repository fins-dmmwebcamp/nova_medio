class  ProductsController < ApplicationController
  def index
    @products_new = Product.all.order(id: "DESC")
    # @products_fovorite = Product.all
    # @products_favorite = Product.joins(:favorites).group(:product_id).order('count(customer_id) desc')
    @products_favorite = Product.all.joins(:favorites).group(:product_id).order('count(customer_id) desc')
    @products_hot = Product.all.order(sales: "DESC")
  end

  def show
  end
end
