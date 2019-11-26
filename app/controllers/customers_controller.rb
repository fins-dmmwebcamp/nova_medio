class CustomersController < ApplicationController

before_action :authenticate_customer!, only: [:edit, :update,:leave, :show]
before_action :current_customer, only: [:edit, :update,:leave, :show]


  def show
  	@customer = Customer.find(params[:id])
  	@destination = Destination.where(is_main: true).find_by(customer_id: @customer.id)
    @destinations = @customer.destinations.reverse_order

  end

  def edit
  end

  def update
  end

  def leave
  end

  def leave_page
  end

end


def customer_prams
  params.require(:customer).permit(:name_full,:phone_number,:email,destionations_attributes:[:postal_code,:address_prefecture,:address_city,:address_after])
end