class DescriptionsController < ApplicationController


  def create
    @title = Title.find(params[:title_id])
    @tweak = @title.tweaks.find(params[:tweak_id])

    @description = @tweak.descriptions.create(description_params)

    redirect_to title_path(@title)
  end


  private
    def description_params
      params.require(:description).permit(:text)
    end

end