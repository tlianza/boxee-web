class MediaShare < ActiveRecord::Base
  set_primary_key :idShare
  named_scope :pictures, :conditions => "strType='pictures'"
  
  def name; strLabel; end
  def path; strPath; end
  def type; strType; end
  def scan_type; iScanType; end
  def last_scanned; iLastScanned end
  
  def is_picture_share?
    type == 'pictures'
  end
  
  def to_s; name; end
  
  def get_files(sub_dir, *args)
    return get_files_or_directories(sub_dir, false, args)
  end
  
  def get_directories(sub_dir, *args)
    return get_files_or_directories(sub_dir, true, args)
  end
  
private  

  #Grabs all directores or files (depending if directories=true), ignoring hidden
  #ones (starting with a .) and returns an array of paths 
  def get_files_or_directories(sub_dir, directories, *args)
    d = (sub_dir.blank? ? '' : sub_dir+'/')
    curr_path = path+d
    return_elems = []
    limit = nil
    limit = args.flatten[0].to_i if args.flatten.length > 0
    count = 0
    
    Dir.foreach(curr_path){ |file_name|  
      if !file_name.starts_with?('.') then
        if (File.directory?(File.new(curr_path+file_name)) and directories) or
           (!File.directory?(File.new(curr_path+file_name)) and !directories)
          return_elems << d+file_name 
          count +=1
        end
      end
      
      return return_elems if(limit && count >= limit)    
    }
    
    return return_elems
  end
  
end
