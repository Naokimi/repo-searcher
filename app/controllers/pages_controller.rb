class PagesController < ApplicationController
  def home
    @repos = params[:repos]
  end

  def search
    # call search service
    # respond to format
    # redirect to home or render json repos
  end
end
