class Admin::ArtistsController < ApplicationController
  def index
    @artists=Artist.page(params[:page])
  end

  def new
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
