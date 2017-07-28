class Admin::RestaurantLocationsController < ApplicationController
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :authenticate_admin # 再檢查是否有admin權限
  before_action :find_restaurant

  def show
    @location = @restaurant.location
  end

  def new
    @location = @restaurant.build_location
  end

  def create
    @location = @restaurant.build_location( location_params )
    if @location.save
      redirect_to admin_restaurant_location_path( @restaurant )
    else
      render :action => :new
    end
  end

  def edit
    @location = @restaurant.location
  end

  def update
    @location = @restaurant.location

    if @location.update( location_params )
      redirect_to  admin_restaurant_location_path( @restaurant )
    else
      render :action => :edit
    end
  end

  def destroy
    @location = @restaurant.location
    @location.destroy
    redirect_to admin_restaurant_location_path( @restaurant )
  end

  protected

  def find_restaurant
    @restaurant = Restaurant.find( params[:restaurant_id] )
  end

  def location_params
    params.require(:location).permit(:location, :restaurant_id)
  end
end
