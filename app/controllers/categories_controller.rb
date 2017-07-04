class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    @recent_descriptions = Description
                      .includes(:user, tweak: :title)
                      .order(upvotes: :desc)
                      .where("created_at > ? ", 2.days.ago)
                      .limit(9)
  end

  def show
    @category = Category.find(params[:id])
    @titles = @category.titles.order(name: :asc)
  end


end
