class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    @recent_tweaks = Tweak
                      .includes(:title, :user)
                      .order(created_at: :desc)
                      .limit(9)
  end

  def show
    @category = Category.find(params[:id])
    @titles = @category.titles.includes(:tweaks)
  end


end
