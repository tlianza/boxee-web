class AudioFilesController < ApplicationController
  layout 'home'
    
  # GET /audio_files
  # GET /audio_files.xml
  def index
    @audio_files = AudioFile.all(:include=>[:album, :artist])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audio_files }
    end
  end

  # GET /audio_files/1
  # GET /audio_files/1.xml
  def show
    @audio_file = AudioFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @audio_file }
    end
  end

  # GET /audio_files/new
  # GET /audio_files/new.xml
  def new
    @audio_file = AudioFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @audio_file }
    end
  end

  # GET /audio_files/1/edit
  def edit
    @audio_file = AudioFile.find(params[:id])
  end
  
  # GET /audio_files/1/play
  def play
    @audio_file = AudioFile.find(params[:id])
    send_file @audio_file.path
  end

  # POST /audio_files
  # POST /audio_files.xml
  def create
    @audio_file = AudioFile.new(params[:audio_file])

    respond_to do |format|
      if @audio_file.save
        format.html { redirect_to(@audio_file, :notice => 'AudioFile was successfully created.') }
        format.xml  { render :xml => @audio_file, :status => :created, :location => @audio_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @audio_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /audio_files/1
  # PUT /audio_files/1.xml
  def update
    @audio_file = AudioFile.find(params[:id])

    respond_to do |format|
      if @audio_file.update_attributes(params[:audio_file])
        format.html { redirect_to(@audio_file, :notice => 'AudioFile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @audio_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_files/1
  # DELETE /audio_files/1.xml
  def destroy
    @audio_file = AudioFile.find(params[:id])
    @audio_file.destroy

    respond_to do |format|
      format.html { redirect_to(audio_files_url) }
      format.xml  { head :ok }
    end
  end
end
