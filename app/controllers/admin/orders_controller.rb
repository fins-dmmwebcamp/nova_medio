class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @price = total(@order.orders_details)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: root_path)
  end

  def user_index
    @customer = Customer.find_by(id: params[:customer_id])
  end

  private

    def order_params
      params.require(:order).permit(:shipping_status)
    end

    def total(items)
      total = 0
      items.each do |item|
        total += item.price * item.amount
      end
      total
    end

end
