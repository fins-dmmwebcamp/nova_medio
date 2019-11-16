class FavoritesController < ApplicationController
  def index
    favorites = Favorites.where(user_id: current_user.id)
    p favorites
    @products = Products.where(id: favorites.product_id)
  end

  def create
    favorite = current_user.Favorites.new()
    favorite.save()
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
  end
end
