class Admin::ArrivalsController < ApplicationController
  def index
    @arrivals = Arrivals.all
  end

  def new
    @arrival = Arrivals.new
  end

  def create
    @arrival = Arrivals.new(arrival_params)
    if @arrival.save
      redirect_to arrivals_path
    else
      render action: :new
    end
  end
  private
  def arrival_params
    params.require(:arrival).permit(:amount, :product_id)
  end
end
