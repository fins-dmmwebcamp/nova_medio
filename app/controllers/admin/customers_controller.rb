class Admin::CustomersController < ApplicationController


  def index

        @customers = Customer.page(params[:page]).per(15).search(params[:search])
     

  end

  def show
    @customer = Customer.find(params[:id])
    @destination = Destination.find(params[:id])
  end

  def edit
    @cutomer = Customer.find(params[:id])
  end

  def update
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.is_deleted = true
    customer.is_deleted.save
  end



def customer_prams
  params.require(:customer).permit(:name_full,:phone_number,:email,:posta_code,destionations:[:postal_code])
end



end