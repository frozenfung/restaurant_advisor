class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :authenticate_admin # 再檢查是否有admin權限

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to :action => :index
  end

  protected

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hour, :tel, :address, :description, :image)
  end





end
