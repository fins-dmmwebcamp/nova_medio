class Admin::LabelsController < ApplicationController
  before_action :authenticate_admin!
   def create
    @label=Label.new(label_params)
    if @label.save
      flash[:notice] = "You created label successfully !!!!!"
      redirect_to admin_labels_path
        else
      flash.now[:notice] = "error !!!!!"
      render :new
    end
  end

  def index
  @labels=Label.where(is_deleted: false).page(params[:page])
  @posts = Label.where(is_deleted: false).search(params[:search]).page(params[:page])#@postは検索結果を入れる変数です。検索→リダイレクト時にこれを一覧表示します
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
      flash[:notice]="Label has successfully edited!"
      redirect_to admin_labels_path
    else
      flash.now[:notice] = "error error not successfully edited!"
      render :edit
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.is_deleted = true
    @label.save
    flash[:notice]="Label has successfully deleted!"
    redirect_to admin_labels_path
  end

  private
    def label_params
      params.require(:label).permit(:name)
    end
end
