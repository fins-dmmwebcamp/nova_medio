class Admin::LabelsController < ApplicationController
   def create
    @label=Label.new(label_params)
    if @label.save
      flash[:notice] = "You created label successfully !!!!!"
      redirect_to admin_labels_path
        else
      flash[:notice] = "error !!!!!"
      render :new
    end
  end

  def index
  @labels=Label.page(params[:page])
  end

  def new
    @label=Label.new
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
      label = Label.find(params[:id])
    label.destroy
    flash[:notice]="Label has successfully deleted!"
    redirect_to admin_labels_path
  end

  private
    def label_params
      params.require(:label).permit(:name)
    end
end
