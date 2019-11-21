class Admin::ReviewsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
		@reviews = Review.where(customer_id: @customer.id)
  end

  def edit
    @review = Review.find(params[:id])
    @customer = Customer.find(@review.customer_id)
    @product = Product.find(@review.product_id)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_product_path(@review.product)
    else
      render :edit
    end

  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_back(fallback_location: root_path)
  end

  private

	def review_params
		params.require(:review).permit(:title, :body, :rank, :customer_id, :product_id)
	end
end
