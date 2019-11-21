class Admin::CustomersController < ApplicationController





  def index
    @customers = Customer.all
  end

  def show
    @cutomer = Customer.find(params[:id])
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
end
