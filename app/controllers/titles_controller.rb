class TitlesController < ApplicationController

  def show
    @title = Title.eager_load(tweaks: [descriptions: :user]).find(params[:id])
  end

  def create
    @title = current_user.titles.create(title_params)

    unless @title.valid?
      flash[:error] = @title.errors.full_messages
    end

    redirect_to category_path(@title.category_id)
  end

  private
    def title_params
      params.require(:title).permit(:name, :category_id, :user_id)
    end
end