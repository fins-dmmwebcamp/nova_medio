class Admin::LabelsController < ApplicationController
  def index
  @labels=Label.page(params[:page])
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
