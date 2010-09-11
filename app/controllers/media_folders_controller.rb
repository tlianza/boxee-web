class MediaFoldersController < ApplicationController
  layout 'home'
    
  # GET /media_folders
  # GET /media_folders.xml
  def index
    @media_folders = MediaFolder.all(:include=>[:video_files])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @media_folders }
    end
  end

  # GET /media_folders/1
  # GET /media_folders/1.xml
  def show
    @media_folder = MediaFolder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media_folder }
    end
  end

end
