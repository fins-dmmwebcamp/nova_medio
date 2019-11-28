class  ProductsController < ApplicationController
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
  end
end
