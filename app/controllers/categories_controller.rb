class CategoriesController < ApplicationController
  before_action :require_admin, only: [:show, :new]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end


  private

  def category_params
    params.require(:category).permit(:category_name)
  end

  def require_admin
    if not (user_signed_in? && current_user.admin?)
      flash[:alert] = "Only admin can perform that action"
      redirect_to root_path
    end
  end
end