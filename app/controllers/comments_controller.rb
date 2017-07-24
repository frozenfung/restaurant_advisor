class CommentsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.create(params[:comment].permit( :restaurant_id, :user_id, :comment_id, :comment))
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to restaurant_path(@restaurant)
  end



end
