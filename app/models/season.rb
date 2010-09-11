class Season < ActiveRecord::Base
  set_primary_key :idSeason
  belongs_to :series
  has_many :video_files, 
           :foreign_key=>'idVideo', 
           :order=>'iEpisode, iYear DESC'
  
  def number; iSeasonNum; end
  def description; strDescription; end
  def year; iYear; end
  
  def to_s; "Season #{number}"; end
end
