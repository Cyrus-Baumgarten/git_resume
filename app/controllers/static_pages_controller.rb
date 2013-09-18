class StaticPagesController < ApplicationController
  require 'open-uri'
    
  def home
  end

  def score
    if params[:name].blank?
      redirect_to root_path
    end
    @gotten = JSON.parse(open("https://api.github.com/users/#{params[:name]}").read)
    @repos = JSON.parse(open(@gotten['repos_url']).read)    
    @score = 
      @gotten['public_repos'].to_i + 
      @gotten['public_gists'].to_i +
      @gotten['followers'].to_i
  end
end