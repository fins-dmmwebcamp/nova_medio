class FavoritesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @products = Product.joins(:favorites).where(favorites: {customer_id: current_customer.id})
  end

  def create
    favorite = current_customer.favorites.new(product_id: params[:product_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find_by(product_id: params[:id], customer_id: current_customer.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
