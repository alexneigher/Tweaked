class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    @highest_rated_descriptions_all_time = descriptions
    @current_weeks_highest_rated_descriptions = descriptions.where("created_at > ?", 7.days.ago)
    @most_recent_descriptions = descriptions.reorder(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
    @titles = @category.titles.order(name: :asc).page(params[:page]).per(1500)
  end

  private
    def descriptions
        Description
          .includes(:user, tweak: :title)
          .order(upvotes: :desc)
          .limit(9)
    end


end
