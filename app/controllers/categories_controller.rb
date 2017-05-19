class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
    @recent_tweaks = Tweak.includes(:title).order(created_at: :desc).limit(10)
  end

  def show
    @category = Category.find(params[:id])
    @titles = @category.titles.includes(:tweaks)
  end


end