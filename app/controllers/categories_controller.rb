class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 15).order :name
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params_category
    @category.save
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    @category.update_attributes params_category
  end

  def destroy
    @category = Category.find(params[:id]).destroy
  end

  private
  def params_category
    params.require(:category).permit :name, :description 
  end

  def load_category
    @categories = Category.paginate(page: params[:page]).order :name
  end
end
