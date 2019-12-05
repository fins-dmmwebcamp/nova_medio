class DestinationsController < ApplicationController

before_action :authenticate_customer!, only: [:new,:create,:edit, :update,:show]
before_action :current_customer, only: [:new,:create,:edit, :update, :show]


  def new
  	@destination = Destination.new
  end

  def create

  	@destination = Destination.new(destination_params)
  	@destination.customer_id = current_customer.id
    @destination.is_main = false
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
  	params.require(:destination).permit(:name,:name_first,:name_last,:name_first_kana,:name_last_kana,:postal_code,:address_prefecture,:address_city,:address_after,:customer_id)
  end

end
