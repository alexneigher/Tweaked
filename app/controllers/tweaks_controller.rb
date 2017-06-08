class TweaksController < ApplicationController

  def create

    @title = Title.find(params[:title_id])

    if params[:description].blank?
      flash[:error] = 'Please provide a description'
      redirect_to title_path(@title) and return
    end

    @tweak = @title.tweaks.create(name: tweak_name, user: current_user)
    @tweak.descriptions.create(text: params[:description], user: current_user)

    @descriptions = @tweak.descriptions.includes(:user).order(upvotes: :desc)

    render :show
  end

  def show
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.find(params[:id])
    @descriptions = @tweak.descriptions.includes(:user).order(upvotes: :desc)
  end

  private
    def tweak_name
      params[:characters].join('')
    end

end
