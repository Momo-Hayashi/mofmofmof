class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @property = Property.all
  end
  def new
    @property = Property.new
    2.times { @property.closest_stations.build }
  end
  def confirm
    @property = Property.new(property_params)
    # @closest_stations = @property.closest_stations(property_params)
    # binding.irb
    render :new if @property.invalid?
  end
  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to properties_path, notice: "保存しました！"
      else
        render :new
      end
    end
  end
  def show
    @closest_stations = @property.closest_stations
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice:"アップデートしました！"
    else
      render :edit
    end
  end
  def destroy
    @property.destroy
    redirect_to properties_path, notice: "削除しました！"
  end

  private
  def property_params
  params.require(:property).permit(:name, :price, :address, :years_old, :note,
    closest_stations: [:line, :staion, :distance, :property_id])
  end
  def set_property
  @property = Property.find(params[:id])
  end
end
