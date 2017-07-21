class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!  # 這個是 devise 提供的方法，先檢查必須登入
  before_action :authenticate_admin # 再檢查是否有admin權限
  before_action :set_category, :only => [ :show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to :action => :index
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to :action => :index
  end

  def destroy
    @category.destroy
    redirect_to :action => :index
  end


  protected

  def category_params
    params.require(:category).permit(:name)
  end

end
