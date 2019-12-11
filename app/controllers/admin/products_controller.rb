class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:search]
			@products = Product.search(params[:search])
		elsif
	    if params[:key] == nil
	      @products = Product.all
	    elsif params[:key] == "new"
	      @products = Product.all.order(id: "DESC")
	    elsif params[:key] == "favorite"
	      @products = Product.all.joins(:favorites).group(:product_id).order('count(customer_id) desc')
	    elsif params[:key] == "hot"
	      @products = Product.all.order(sales: "DESC")
	    end
		end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    if @product.on_sale == true
      @on_sale = "販売中"
    else
      @on_sale = "販売停止中"
    end
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
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @disc = @product.discs
  end

  # def update
  #   @product = test1(product_params)
  #   if @product.update
  #     redirect_to admin_product_path(@product)
  #   else
  #     render :edit
  #   end
  # end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params) #この時点で変更点を受け取っている。そのため、上の処理がされないままupdateをしようとしているので、orderに値が入らない。
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.update(is_deleted: true)
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :artist_id, :label_id, :genre_id, :price, :released_at, :product_image, discs_attributes: [:id, :order, songs_attributes: [:id, :order, :name]])
  end

  def delete_product
    params.require(:product).permit(:is_deleted)
  end

  def test1(product)
    product[:discs_attributes].each_with_index do |disc,index|
      disc.order = index + 1
      disc[:songs_attributes].each_with_index do |song,index|
        song.order = index + 1
      end
    end
    product
  end

end
