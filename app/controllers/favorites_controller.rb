class FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @products = Product.joins(:favorites).where(favorites: {customer_id: current_customer.id})
  end

  def create
    favorite = current_user.Favorites.new(product_id: params[:product_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
