class TweaksController < ApplicationController

  before_action :authenticate_user!, only: :create

  def create

    @title = Title.find(params[:title_id])

    if params[:description].blank?
      flash[:error] = 'Please provide a description'
      redirect_to title_path(@title) and return
    end

    @tweak = @title.tweaks.find_or_create_by(name: tweak_name) do |t|
      # if you got in here, this is a new tweak
      t.update(user: current_user)
    end

    @description = @tweak.descriptions.create(text: params[:description], user: current_user)

    @descriptions = @tweak.descriptions.includes(:user, :likes).order(likes_count: :desc, created_at: :desc)

    
    TwitterService.new(@description.id).delay.post_tweet


    @create = true
    render :show
  end

  def show
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.find(params[:id])
    @descriptions = @tweak.descriptions.includes(:user, :likes).order(likes_count: :desc, created_at: :desc)
  end

  private
    def tweak_name
      params[:characters].join('')
    end

end
