class ReviewsController < ApplicationController
	before_action :authenticate_customer!

	def index
		@customer = Customer.find(params[:customer_id])
		@reviews = Review.where(customer_id: @customer.id)
	end

	def new
		@product = Product.find(params[:product_id])
		@review = current_customer.reviews.new
	end

	def create
		@review = current_customer.reviews.new(review_params)
		@review.product_id = params[:product_id]
		if @review.save
			redirect_to orders_path
		else
			render :new
		end
	end

  private

	def review_params
		params.require(:review).permit(:title, :body, :rank, :customer_id, :product_id)
	end

end
