class Admin::ArrivalsController < ApplicationController
  def index
    @arrivals = Arrival.all
  end

  def new
    @product = Arrival.new
  end

  def create
    @arrival = Arrival.new(arrival_params)
    if @arrival.save
      @product = Product.find(@arrival.product_id)
      @product.stock += @arrival.amount
      @product.update(stock: @product.stock)
      redirect_to admin_arrivals_path
    else
      render action: :new
    end
  end

  private

  def arrival_params
    params.require(:arrival).permit(:amount, :product_id)
  end

end
