class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


end
