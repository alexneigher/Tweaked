class TitlesController < ApplicationController

  before_action :authenticate_user!, only: :create

  def show
    @title = Title.includes(:tweaks).find(params[:id])
    @tweaks = @title.tweaks.includes(:user, descriptions: :likes).order(:created_at)
  end

  def create
    @title = current_user.titles.create(title_params)

    unless @title.valid?
      flash[:error] = @title.errors.full_messages
    end

    redirect_to category_path(@title.category_id)
  end

  def random
    @title = Title.order("RANDOM()").first
    redirect_to title_path(@title)
  end

  private

    def title_params
      params.require(:title).permit(:name, :category_id, :user_id)
    end
end
