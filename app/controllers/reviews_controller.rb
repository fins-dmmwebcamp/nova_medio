class ReviewsController < ApplicationController
  def index
  end

  def new
  	@product = Product.find(params[:product_id])
  	@review = Review.new
  end

  def create
  	@review = Review.new
  	@review_customer_id = current_user_id
	  	if @review.save
	  		redirect_to orders_path
	  	else
	  		render :new
	  	end

  end


  def private

  	def review_prams
  		params.require(:review).permit(:title,:body,:rank,:customer_id,:product_id)
  	end

  end

end
