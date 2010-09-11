class Series < ActiveRecord::Base
  set_primary_key :idSeries
  has_many :seasons, :foreign_key=>'idSeries', :order=>'iSeasonNum, iYear'
  has_many :video_files, :foreign_key=>'strSeriesId', :primary_key=>'strBoxeeId', :order=>'iSeason, iEpisode, iYear DESC'
  
  def title; strTitle; end
  def description; strDescription; end
  def year; iYear; end
  
  def to_s; title; end
  
end
