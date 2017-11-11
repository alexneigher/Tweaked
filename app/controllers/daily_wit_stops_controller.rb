class DailyWitStopsController < ApplicationController
  http_basic_authenticate_with name: "letterloose", password: "nougatcenter"
  before_action :authenticate_user!

  before_action :fetch_descriptions, except: :create
  before_action :fetch_wit_stops, except: :create
  
  def index
    
  end

  def create
    @daily_wit_stop = DailyWitStop.create(user: current_user, description_id: params[:description_id])
    if @daily_wit_stop.valid? 
      redirect_to daily_wit_stops_path
    else
      redirect_to daily_wit_stops_path, flash: { error: @daily_wit_stop.errors.full_messages }
    end
  end

  def new
    @preview_description = Description.includes(:user, :likes, tweak: :title).find(params[:description_id])
  end


  private
    def fetch_wit_stops
      @daily_wit_stops = DailyWitStop.includes(:user, description: [:likes, tweak: :title])
    end

    def fetch_descriptions
      @page = params[:page]
      @descriptions = descriptions.page(@page).per(25)
    end

    def descriptions
      Description
        .order(created_at: :desc)
        .includes(:user, :likes, tweak: :title)
    end
end