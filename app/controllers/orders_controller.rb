class OrdersController < ApplicationController
  def index
    @orders = Orders.where(user_id: current_user.id)
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
