class TitlesController < ApplicationController

  before_action :authenticate_user!, only: :create

  def show
    @title = Title.includes(:tweaks).find(params[:id])
    @tweaks = @title.tweaks.includes(:user, descriptions: :likes).order(:created_at)
  end

  def create
    @title = current_user.titles.find_or_create_by(name:title_params[:name], category_id: title_params[:category_id])

    if @title.valid?
      redirect_to title_path(@title)
    else
      flash[:error] = @title.errors.full_messages
      redirect_to root_path
    end
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
