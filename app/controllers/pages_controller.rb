class PagesController < ApplicationController
  before_action :set_client, only: %i[index show destroy update]
  before_action :set_repo, only: %i[show destroy update]

  def index
    @my_repos = @client.repos({}, query: { type: "owner", sort: "asc" })
    @private_repos = @client.repos({}, query: { type: "private", sort: "asc" })
  end

  def show
    @repo = @client.repo(params[:repo_full_name])
    @collabs = @client.collabs(@repo.id).map { |collab| collab[:login] }
  end

  def destroy
    repo_full_name = params[:repo_full_name]
    collab_login = params[:collab_login]

    if @repo[:owner][:login] == collab_login
      flash[:alert] = "Action can't be performed, as #{collab_login} is the owner of the repo"
      redirect_to show_path(repo_full_name: repo_full_name)
    elsif @client.remove_collaborator(repo_full_name, collab_login)
      flash[:notice] = "#{collab_login} has been removed successfully!"
      redirect_to show_path(repo_full_name: repo_full_name)
    else
      flash[:alert] = "#{collab_login} has not been removed!"
      redirect_to show_path(repo_full_name: repo_full_name)
    end
  end

  def update
    repo_full_name = params[:repo_full_name]
    collab_login = params[:collab_login]

    if @repo[:owner][:login] == collab_login
      flash[:alert] = "Action can't be performed, as #{collab_login} is already the owner of the repo"
      redirect_to show_path(repo_full_name: repo_full_name)
    elsif @client.add_collaborator(repo_full_name, collab_login)
      flash[:notice] = "#{collab_login} has been added successfully!"
      redirect_to show_path(repo_full_name: repo_full_name)
    else
      flash[:alert] = "#{collab_login} has not been removed!"
      redirect_to show_path(repo_full_name: repo_full_name)
    end
  end

  private

  def set_client
    @client = Octokit::Client.new(access_token: (ENV["GITHUB_PERSONAL_TOKEN"]).to_s)
  end

  def set_repo
    @repo = @client.repo(params[:repo_full_name])
  end
end
