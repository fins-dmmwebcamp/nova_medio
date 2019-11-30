class DestinationsController < ApplicationController
  def new
  	@destination = Destination.new
  end

  def create

  	@destination = Destination.new(destination_params)
  	@destination.customer_id = current_customer.id
  	binding.pry
  	if @destination.save
  		redirect_to confirm_payment_path
  	else
  		render :new
  	end
  end

  def edit
  	@destination = Destination.find(params[:id])
  	@customer = Customer.find_by(id: @destination.customer_id)
  end

  def update
    @destination = Destination.find(params[:id])
  	@customer = Customer.find_by(id: @destination.customer_id)
  	if @destination.update(destination_params)
  		redirect_to customer_path(@customer)
  	else
  		render :edit
  	end
  end


  private

  def destination_params
  	params.require(:destination).permit(:name,:postal_code,:address_prefecture,:address_city,:address_after,:customer_id)
  end

end
