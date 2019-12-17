# encoding: utf-8
class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @total_amount = 0
    @cart_items.each do |item|
      @total_price += item.amount * item.product.price
      @total_amount += item.amount
    end
  end

  def create
    @item = current_customer.cart_items.new(cart_item_params)
    product = @item.product
    if product.on_sale && !product.is_deleted
      if product.stock >= @item.amount
        @item.save
        flash[:success] = "カートに追加されました"
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = "購入数が在庫数を超えています"
        redirect_to product_path(product)  
      end
    else
      flash[:alert] = "この商品はカートに追加できません"
      redirect_to product_path(product)
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :product_id)
  end
end
