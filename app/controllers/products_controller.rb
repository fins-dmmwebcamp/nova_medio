class  ProductsController < ApplicationController
	before_action :authenticate_customer!
  def index
    if params[:key] == nil
      @products = Product.all
    elsif params[:key] == "new"
      @products = Product.all.order(id: "DESC")
    elsif params[:key] == "favorite"
      @products = Product.all.joins(:favorites).group(:product_id).order('count(customer_id) desc')
    elsif params[:key] == "hot"
      @products = Prodct.all.order(sales: "DESC")
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @favorite = Favorite.new
    @item = current_customer.cart_items.build
    @product = Product.find(params[:id])
    if @product.on_sale == true
      @on_sale = "販売中"
    else
      @on_sale = "販売停止中"
    end
  end
end
