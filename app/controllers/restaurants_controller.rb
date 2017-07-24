class RestaurantsController < ApplicationController
  before_action :set_restaurant, :only => [ :show ]

  def index
    @restaurants = Restaurant.page(params[:page]).per(5)
    @categoires = Category.all
  end

  def show
  end


end
