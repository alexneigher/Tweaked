class TweaksController < ApplicationController

  def create
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.create(name: tweak_name)

    render :show
  end

  def show
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.includes(:descriptions).find(params[:id])
  end

  private
    def tweak_name
      params[:characters].join('')
    end

end