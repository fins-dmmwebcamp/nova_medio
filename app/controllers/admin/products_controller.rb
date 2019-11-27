class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @product = Product.new
    @disc = @product.discs.build
    @song = @disc.songs.build
  end

  def create
    @product = Product.new(product_params)
    @product.discs.each_with_index do |disc,index|
      disc.order = index + 1
      disc.songs.each_with_index do |song,index|
        song.order = index + 1
      end
    end
    @product.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :artist_id, :label_id, :genre_id, :price, :released_at, :product_image, discs_attributes: [:id, :order, songs_attributes: [:id, :order, :name]])
  end
end
