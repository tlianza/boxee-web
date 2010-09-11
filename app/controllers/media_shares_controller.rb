class MediaSharesController < ApplicationController
  layout 'home'
  
  # GET /media_shares
  # GET /media_shares.xml
  def index
    @media_shares = MediaShare.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @media_shares }
    end
  end

  # GET /media_shares/1
  # GET /media_shares/1.xml
  def show
    @media_share = MediaShare.find(params[:id])
    @dir = params[:dir]
    @files = @media_share.get_files(@dir)
    @directories = @media_share.get_directories(@dir)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media_share }
    end
  end
  
  def view
    @media_share = MediaShare.find(params[:id])
    name = params[:name]
    unless name.blank?
      send_file @media_share.path + name
    else
      logger.error("Asked to render a file without a name for #{@media_share}")
      send_data('', :status=>404) and return
    end
  end
  
  def directory_preview
    @media_share = MediaShare.find(params[:id])
    @dir = params[:dir]
    @files = @media_share.get_files(@dir, 4)
    @directories = @media_share.get_directories(@dir, 4)
    render(:layout=>'frame')
  end

  # GET /media_shares/new
  # GET /media_shares/new.xml
  def new
    @media_share = MediaShare.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @media_share }
    end
  end

  # GET /media_shares/1/edit
  def edit
    @media_share = MediaShare.find(params[:id])
  end

  # POST /media_shares
  # POST /media_shares.xml
  def create
    @media_share = MediaShare.new(params[:media_share])

    respond_to do |format|
      if @media_share.save
        format.html { redirect_to(@media_share, :notice => 'MediaShare was successfully created.') }
        format.xml  { render :xml => @media_share, :status => :created, :location => @media_share }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @media_share.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /media_shares/1
  # PUT /media_shares/1.xml
  def update
    @media_share = MediaShare.find(params[:id])

    respond_to do |format|
      if @media_share.update_attributes(params[:media_share])
        format.html { redirect_to(@media_share, :notice => 'MediaShare was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media_share.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /media_shares/1
  # DELETE /media_shares/1.xml
  def destroy
    @media_share = MediaShare.find(params[:id])
    @media_share.destroy

    respond_to do |format|
      format.html { redirect_to(media_shares_url) }
      format.xml  { head :ok }
    end
  end
  
  def render_file_as_html(path)
  end
end
