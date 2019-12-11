class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.all
    @totals = []
    @orders.each_with_index do |order, i|
      @totals.push(total(order.orders_details))
      @totals[i] += 500
    end
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
    @orders = @customer.orders.all
    @totals = []
    @orders.each_with_index do |order, i|
      @totals.push(total(order.orders_details))
      @totals[i] += 500
    end
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
