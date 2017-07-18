module Users
  class DescriptionsController < ApplicationController
    
    def index
      user = User.find(params[:user_id])
      @descriptions = user.descriptions.order(created_at: :desc).includes(tweak: :title)
    end

  end
end