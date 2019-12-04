class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer.id)
    @totals = []
    @orders.each_with_index do |order,i|
      details = order.orders_details
      @totals[i] = 0
      details.each do |detail|
        @totals[i] += detail.price * detail.amount
      end
    end
  end

  def new
    @order = current_customer.orders.new
    @destinations = Destination.where(customer_id: current_customer.id)
    @orders_details=[]
    current_customer.cart_items.each do |item|
      orders_detail = Order.new(product_id: item.product.id, price: item.price, amount: item.amount)
      @orders_details.push(orders_detail)
    end
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
