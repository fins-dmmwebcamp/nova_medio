class Admin::CustomersController < ApplicationController


  def index
    @customers = Customer.where(is_deleted: false).page(params[:page]).per(15).search(params[:search])
  end


  def show
    @customer = Customer.find(params[:id])
    @destination = Destination.find_by(customer_id: @customer.id)
  end


  def edit
    @customer = Customer.find(params[:id])
    @destination = Destination.where(is_main: true).find_by(customer_id: @customer.id)
  end


  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
    redirect_to admin_customer_path(params[:id])
    else
      render :edit
    end

  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.is_deleted = true
    @customer.save
    redirect_to admin_customers_path

  end

end



  private



def customer_prams
  params.require(:customer).permit(:name_full,:phone_number,:email,destionations_attributes:[:postal_code,:address_prefecture,:address_city,:address_after,:_destroy,:id])
end

