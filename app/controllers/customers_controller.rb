class CustomersController < ApplicationController
before_action :authenticate_customer!
before_action :correct_customer, only: [:edit, :update,:leave, :show]

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
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end

  end

  def leave_page
    @customer = Customer.find(params[:id])
  end

  def leave
    @customer = Customer.find(params[:id])
    @customer.is_deleted = true
    if @customer.save
      redirect_to products_path
    end
  end

    private

      def customer_params
        params.require(:customer).permit(:name_first,:name_last,:name_first_kana,:name_last_kana,:phone_number,:email,:is_deleted,destinations_attributes:[:postal_code,:address_prefecture,:address_city,:address_after,:_destroy,:id])
      end

      def correct_customer
        @customer = Customer.find(params[:id])
        if @customer.id != current_customer.id
          redirect_to products_path
        end
      end



end
