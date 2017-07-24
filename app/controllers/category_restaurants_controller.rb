class CategoryRestaurantsController < ApplicationController
  before_action :find_category

  def index
    @restaurants = @category.restaurants
  end

  def show
    @restaurant = @category.restaurants.find( params[:id] )
  end




  protected

  def find_category
    @category = Category.find( params[:category_id] )
  end
end
