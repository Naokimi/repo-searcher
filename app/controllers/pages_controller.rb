class PagesController < ApplicationController
  def home
    @query = params[:query]
    @repos = GithubCallerService.call(@query) if @query.present?
  end
end
