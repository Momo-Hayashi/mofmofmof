class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @property = Property.all
  end
  def new
    @property = Property.new
  end
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "保存しました！"
    else
      render :new
  end
  def update
    if @property.updated
      redirect_to properties_path, notice: "更新しました！"
    else
    render :edit
  end
  def destroy
    @property.destroy
    redirect_to properties_path, notice: "削除しました！"
  end
  
  private
  def property_params
  params.require(:property).permit(:name, :price, :address, :years_old, :note)
  end
  def set_property
  @property = Property.find(params[:id])
  end
end
