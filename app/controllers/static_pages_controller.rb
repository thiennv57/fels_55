class StaticPagesController < ApplicationController
  def home
  end

  def category
    @categories = Category.paginate(page: params[:page], per_page: 15).order :name
  end
end
