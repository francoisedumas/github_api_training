class PagesController < ApplicationController
  before_action :set_client, only: %i[repositories repository]

  def repositories
    @my_repos = @client.repos({}, query: {type: 'owner', sort: 'asc'})
    @private_repos = @client.repos({}, query: {type: 'private', sort: 'asc'})
  end

  def repository
    @repo = @client.repo(params[:repo_full_name])
    @collabs = @client.collabs(@repo.id).map{ |collab| collab[:login] }
  end

  private

  def set_client
    @client = Octokit::Client.new(access_token: "#{ENV["GITHUB_PERSONAL_TOKEN"]}")
  end
end
