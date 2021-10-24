gem 'httparty'

class GithubCallerService
  DEFAULT_PAGE = 1
  DEFAULT_PER_PAGE = 30
  MAXIMUM_SEARCHABLE_REPOS = 1000

  attr_reader :query, :page, :per_page

  def self.call(query, page, per_page)
    new(query, page, per_page).call
  end

  def initialize(query, page, per_page)
    @query    = query
    @page     = page.presence || DEFAULT_PAGE
    @per_page = per_page.presence || DEFAULT_PER_PAGE
  end

  def call
    github_call
  end

  private

  def github_call
    return {} if query.empty?

    response = HTTParty.get(
      "https://api.github.com/search/repositories?q=#{query}&page=#{page}&per_page=#{per_page}",
      headers: { 'Authorization': "token #{ENV['GITHUB_OAUTH']}", 'Accept': 'application/vnd.github.v3+json' }
    )

    if response['total_count']
      response
    else
      { error: 'The service is temporarily unavailable. Please contact the administrator' }
    end
  end
end
