class TweaksController < ApplicationController

  def create
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.create(name: tweak_name, user: current_user)
    @descriptions = @tweak.descriptions.includes(:user).order(downvotes: :asc, upvotes: :desc)

    render :show
  end

  def show
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.find(params[:id])
    @descriptions = @tweak.descriptions.includes(:user).order(downvotes: :asc, upvotes: :desc)
  end

  private
    def tweak_name
      params[:characters].join('')
    end

end