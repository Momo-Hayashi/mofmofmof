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
    if @property.invalid?
      2.times { @property.closest_stations.build }
      render :new
    end
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      2.times { @property.closest_stations.build }
      render :new
    else
      if @property.save
        redirect_to properties_path, notice: "物件を登録しました。#{@property.name}の最寄駅は#{@property.closest_stations.count}件です"
      else
        2.times { @property.closest_stations.build }
        render :new
      end
    end
  end

  def show
    @closest_stations = @property.closest_stations
  end

  def edit
    @property.closest_stations.build
  end

  def update
    @closest_stations = @property.closest_stations
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件を編集しました。#{@property.name}の最寄駅は#{@property.closest_stations.count}件です"
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
    params.require(:property).permit(
      :name,
      :price,
      :address,
      :years_old,
      :note,
      closest_stations_attributes: [
        :line,
        :station,
        :distance,
        :property_id,
        :id,
        :_destroy,
      ])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
