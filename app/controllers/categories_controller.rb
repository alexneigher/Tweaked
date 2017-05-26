class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    @recent_tweaks = Tweak
                      .includes(:title, :descriptions, :user)
                      .order(created_at: :desc)
                      .limit(3)
  end

  def show
    @category = Category.find(params[:id])
    @titles = @category.titles.includes(:tweaks)
  end


end
