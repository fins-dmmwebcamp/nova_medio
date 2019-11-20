class Admin::ArtistsController < ApplicationController
   def create
     @artist=Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "You created artist successfully !!!!!"
      redirect_to admin_artists_path
        else
      flash[:notice] = "error !!!!!"
      render :new
    end
   end
def index
    @artists=Artist.page(params[:page])
  end

  def new
    @artist=Artist.new
  end


  def edit
    @artist=Artist.find(params[:id])
  end

  def update
    @artist=Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to admin_artists_path
    else
      flash[:notice] = "error error not successfully edited!"
      render :edit
    end
  end

  def destroy
  end
  private
    def artist_params
      params.require(:artist).permit(:name)
    end
end
