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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
