class Admin::CustomersController < ApplicationController


  def index

    @customers = Customer.where(is_deleted: false).page(params[:page]).per(15).search(params[:search])

  end

  def show
    @customer = Customer.find(params[:id])
    @destination = Destination.find_by(customer_id: params[:id])

  end

  def edit
    @cutomer = Customer.find(params[:id])
  end

  def update
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.is_deleted = true
    customer.save
    redirect_to  admin_customers_path
  end



def customer_prams
  params.require(:customer).permit(:name_full,:phone_number,:email,destionations:[:postal_code])
end



end