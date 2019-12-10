class Admin::ArtistsController < ApplicationController
  before_action :authenticate_admin!
   def create
     @artist=Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "You created artist successfully !!!!!"
      redirect_to admin_artists_path
        else
      flash.now[:notice] = "error !!!!!"
      render :new
    end
   end
def index
    @artists=Artist.page(params[:page])
    @posts = Artist.search(params[:search]).page(params[:page])#@postは検索結果を入れる変数です。検索→リダイレクト時にこれを一覧表示します
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
          flash[:notice]="Artist has successfully edited"
      redirect_to admin_artists_path
    else
      flash.now[:notice] = "error error not successfully edited!"
      render :edit
    end
  end

  def destroy
     artist = Artist.find(params[:id])
    artist.destroy
    flash[:notice]="Artist has successfully deleted!"
    redirect_to admin_artists_path
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end
end
