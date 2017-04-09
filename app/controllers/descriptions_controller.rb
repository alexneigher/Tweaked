class DescriptionsController < ApplicationController
  before_filter :find_title

  def create
    @tweak = @title.tweaks.find(params[:tweak_id])

    @description = @tweak.descriptions.create(description_params)

    redirect_to title_path(@title)
  end

  def upvote
    @tweak = @title.tweaks.find(params[:tweak_id])
    @description = @tweak.descriptions.find(params[:description_id])
    
    @description.upvote!

    redirect_to title_path(@title)
  end

  def downvote
    @tweak = @title.tweaks.find(params[:tweak_id])
    @description = @tweak.descriptions.find(params[:description_id])
    
    @description.downvote!

    redirect_to title_path(@title)
  end


  private

    def find_title
      @title = Title.find(params[:title_id])

    end

    def description_params
      params.require(:description).permit(:text)
    end

end