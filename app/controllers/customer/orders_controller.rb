class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer.id)
    @orders.each do |order|
      sum = 0
      details = order.orders_details
      details.each do |detail|
        sum =detil.price * detail.amount
      end
      order.total = sum
    end
  end
# 難しい！後でやる
  def new
    @order = current_user.Orders.new
  end

  def confirm_payment
  end

  def confirm_order
  end

  def create
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :reciever)
  end
end
