class DescriptionsController < ApplicationController
  before_action :find_title

  def create
    @tweak = @title.tweaks.find(params[:tweak_id])

    @description = @tweak.descriptions.create(description_params.merge(user: current_user))
   
    @descriptions = @tweak.descriptions.includes(:user).order(upvotes: :desc)
  end

  def upvote
    @tweak = @title.tweaks.find(params[:tweak_id])
    @description = @tweak.descriptions.find(params[:description_id])
    
    @description.upvote!
    @descriptions = @tweak.descriptions.includes(:user).order(upvotes: :desc)

    render :vote
  end

  private

    def find_title
      @title = Title.includes(tweaks: :descriptions).find(params[:title_id])

    end

    def description_params
      params.require(:description).permit(:text)
    end

end