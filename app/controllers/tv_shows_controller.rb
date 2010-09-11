class TvShowsController < ApplicationController
  layout 'home'
  
  def index
    @videos = VideoFile.tv_shows.all(:include=>[:season, :series])
  end
  
end
