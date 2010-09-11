class AlbumsController < ApplicationController
  layout 'home'
  
  # GET /albums
  # GET /albums.xml
  def index
    @albums = (params[:year]) ? Album.find(:all, :conditions=>['iYear=?', params[:year]]) : Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

end
