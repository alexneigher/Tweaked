class SearchesController < ApplicationController


  def new
    @titles = Title.where('name ilike ? ', "#{params[:query]}%")
  end

end
