class PagesController < ApplicationController
  def home
    @query = params[:query]
    @per_page = params[:per_page] ? params[:per_page].to_i : GithubCallerService::DEFAULT_PER_PAGE
    @current_page = params[:page] ? params[:page].to_i : 1

    return unless @query.present?

    @repos = GithubCallerService.call(@query, @current_page, @per_page)
    @total_count = @repos['total_count'].to_i
    @total_pages = [@total_count, GithubCallerService::MAXIMUM_SEARCHABLE_REPOS].min / @per_page
  end
end
