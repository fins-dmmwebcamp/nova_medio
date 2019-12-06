class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = Order.where(customer_id: current_customer.id)
    # 小計求める処理
    @totals = []
    @orders.each_with_index do |order,i|
      details = order.orders_details
      @totals[i] = total(details)
    end
  end

  def new
    @order = Order.new
    @destinations = Destination.where(customer_id: current_customer.id)
  end

  def confirm_payment
    @order = Order.new(order_params)
    # 選択したお届け先を入れる
    destination = Destination.find(params[:order][:destination_id])
    @order.postal_code = destination.postal_code
    @order.address = destination.address_full
    @order.reciever = destination.name
    render :confirm_payment
  end

  def confirm_order
    @order = Order.new(order_params)
    @shipping_fee = 500
    @orders_details = store_cart_items_to_a
    @total = total(@orders_details)
    @total += @shipping_fee
  end

  def create
    order = current_customer.orders.new(order_params)
    order.shipping_status = "準備中"
    order.shipping_fee = 500
    order.save
    cart_items = store_cart_items_to_a
    cart_items.each do |item|
      # 在庫・売上更新処理
      product = Product.find(item.product_id)
      stock = product.stock - item.amount
      sales = product.sales + item.amount * item.price
      product.update(stock: stock, sales: sales)
      # ここまで
      item.order_id = order.id
      p item
      item.save
    end
    redirect_to order_path(order)
  end

  def show
    @order = Order.find(params[:id])
    @total = total(@order.orders_details)
  end

  private
  def order_params
    params.require(:order).permit(:payment, :postal_code, :address, :reciever)
  end
  # 注文する商品を配列に格納(表示用)
  def store_cart_items_to_a
    details = []
    current_customer.cart_items.each do |item|
      detail = OrdersDetail.new(
        product_id: item.product_id,
        price: item.product.price,
        amount: item.amount)
      details.push(detail)
    end
    details
  end
  # orders_itemsの購入合計金額を求める
  def total(items)
    total = 0
    items.each do |item|
      total += item.price * item.amount
    end
    total
  end
end
