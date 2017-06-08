class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    @recent_descriptions = Description
                      .includes(:user, tweak: :title)
                      .order(upvotes: :desc)
                      .limit(9)
  end

  def show
    @category = Category.find(params[:id])
    @titles = @category.titles.includes(:tweaks)
  end


end
