class MoviesController < ApplicationController
  layout 'home'
  
  def index
    @videos = VideoFile.movies.all
  end
  
  def show
    @video = VideoFile.find(params[:id])
  end
end
