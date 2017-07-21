class RestaurantsController < ApplicationController
  before_action :set_restaurant, :only => [ :show ]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end


end
