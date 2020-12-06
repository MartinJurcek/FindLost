class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :edit]

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
    @stuffs = @category.stuffs
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def update 
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to @category
    else 
      render 'edit'
    end
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