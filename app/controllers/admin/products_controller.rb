class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @product = Product.new
    # @disc = @products.build_discs
    disc = @product.discs.build
    disc.songs.build
    # @product = @product.discs.build
    # @product.songs.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
