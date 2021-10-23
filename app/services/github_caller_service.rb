gem 'httparty'

class GithubCallerService
  attr_reader :query

  def self.call(query)
    new(query).call
  end

  def initialize(query)
    @query = query
  end

  def call
    github_call
  end

  private

  def github_call
    response = HTTParty.get(
      "https://api.github.com/search/repositories?q=#{query}",
      headers: { 'Authorization': "token #{ENV['GITHUB_OAUTH']}", 'Accept': 'application/vnd.github.v3+json' }
    )

    if response['total_count']
      response
    else
      {}
    end
  end
end
