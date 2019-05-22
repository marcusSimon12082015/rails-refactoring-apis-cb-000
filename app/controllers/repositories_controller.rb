class RepositoriesController < ApplicationController
  def index
    github_service = GithubService.new
    @repos_array = github_service.get_repos
    pry
    #response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    #@repos_array = JSON.parse(response.body)
  end

  def create
    #response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    github_service = GithubService.new
    github_service.create_repo(params[:name])
    redirect_to '/'
  end
end
