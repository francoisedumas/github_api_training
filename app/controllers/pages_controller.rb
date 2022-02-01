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

  def remove
    repo_full_name = params[:repo_full_name]
    collab_login = params[:collab_login]
    flash[:notice] = "#{collab_login} has been removed successfully!"
    redirect_to repository_path(repo_full_name: repo_full_name)
  end

  private

  def set_client
    @client = Octokit::Client.new(access_token: "#{ENV["GITHUB_PERSONAL_TOKEN"]}")
  end
end
