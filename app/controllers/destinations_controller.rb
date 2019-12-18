class DestinationsController < ApplicationController
before_action :authenticate_customer!
# before_action :current_customer

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

	def destroy
		destination = Destination.find(params[:id])
		if destination.is_main
      flash[:alert] = "この住所は削除できません"
      redirect_to customer_path(current_customer)
    else
      destination.destroy
      redirect_to cart_items_path
    end
	end

  private

	def destination_params
		params.require(:destination).permit(:name,:name_first,:name_last,:name_first_kana,:name_last_kana,:postal_code,:address_prefecture,:address_city,:address_after,:customer_id)
  end

end
