class RestaurantsController < ApplicationController
  before_action :set_restaurant, :only => [ :show ]
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入

  def index
    @restaurants = Restaurant.page(params[:page]).per(5)
    @categoires = Category.all
  end

  def show
  end



end
