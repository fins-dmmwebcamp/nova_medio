class Admin::LabelsController < ApplicationController
  def index
    # 検索拡張機能として.search(params[:search])を追加
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
