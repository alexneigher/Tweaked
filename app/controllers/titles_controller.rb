class TitlesController < ApplicationController
  def index
    @titles = Title.includes(:tweaks).all
  end

  def show
    @title = Title.includes(tweaks: :descriptions).find(params[:id])
  end

  def create
    @title = Title.create(title_params)
    redirect_to root_path
  end


  private
    def title_params
      params.require(:title).permit(:name)
    end
end