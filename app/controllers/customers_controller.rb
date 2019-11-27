class CustomersController < ApplicationController

before_action :authenticate_customer!, only: [:edit, :update,:leave, :show]
before_action :current_customer, only: [:edit, :update,:leave, :show]


  def show
  	@customer = Customer.find(params[:id])
  	@destination = Destination.where(is_main: true).find_by(customer_id: @customer.id)
    @destinations = @customer.destinations.reverse_order

  end

  def edit
    @customer = Customer.find(params[:id])
    @destination = Destination.where(is_main: true).find_by(customer_id: @customer.id)
  end

  def update
    @customer = Customer.find(params[:id])

    # binding.pry
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end


  end

  def leave
  end

  def leave_page
  end

end

private

def customer_params
  params.require(:customer).permit(:name_full,:phone_number,:email,destinations_attributes:[:postal_code,:address_prefecture,:address_city,:address_after,:_destroy,:id])
end

# def destination_params
#   params.require(:destination)
# end
