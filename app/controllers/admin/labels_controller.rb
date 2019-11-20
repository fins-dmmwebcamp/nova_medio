class Admin::LabelsController < ApplicationController
  def index
  @labels=Label.page(params[:page])
  end

  def new
  end

  def create
  end

  def edit
    @label=Label.find(params[:id])
  end

  def update
    @label=Label.find(params[:id])
    if @label.update(label_params)
      redirect_to admin_labels_path
    else
      flash[:notice] = "error error not successfully edited!"
      render :edit
    end
  end

  def destroy
  end
  private
    def label_params
      params.require(:label).permit(:name)
    end
end
