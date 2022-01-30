class PagesController < ApplicationController
  def repositories
    @client = Octokit::Client.new(access_token: "#{ENV["GITHUB_PERSONAL_TOKEN"]}")
    @client.repos
    @my_repos = @client.repos({}, query: {type: 'owner', sort: 'asc'})
    @private_repos = @client.repos({}, query: {type: 'private', sort: 'asc'})
  end
end
