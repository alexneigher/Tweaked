class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @titles = @category.titles.includes(:tweaks)
  end


end