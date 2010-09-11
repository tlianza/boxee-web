class MediaFolder < ActiveRecord::Base
  set_primary_key :idFolder
  has_many :video_files, :foreign_key=>'idFolder'
  
  def path; strPath; end
  def folder_type; strType; end
  def has_metadata?; 1==iHasMetadata; end
  def needs_rescan?; 1==iNeedsRescan; end
  def status; strStatus; end
  
  def to_s; path; end
  
  def current_media_share
    #currpath = path[0..path.rindex('/', path.length-2)]
    currpath = path.clone
    path_possibilities = Array.new
    while(lastpos = currpath.rindex('/', currpath.length-2)) 
      path_possibilities << currpath[0..lastpos]
      currpath.slice!(lastpos)
    end
    @current_media_share ||= MediaShare.find(:first, :conditions=>['strPath IN (?)',path_possibilities])
  end
  
  def subdirectory_of_media_share
    return path.gsub(current_media_share.path, '')
  end
  
end
