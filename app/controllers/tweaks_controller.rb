class TweaksController < ApplicationController

  def create
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.create(name: tweak_name)

    redirect_to title_path(@title)
  end


  private
    def tweak_name
      params[:characters].join('')
    end

end