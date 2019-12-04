class  ProductsController < ApplicationController
	before_action :authenticate_customer!
  def index
    @products = Product.all
  end

  def show
  end
end
