class VideoFile < ActiveRecord::Base
  set_primary_key :idVideo
  belongs_to :media_folder, :foreign_key=>'idFolder'
  belongs_to :season, :foreign_key=>'iSeason'
  belongs_to :series, :foreign_key=>'strSeriesId', :primary_key=>'strBoxeeId'
  
  named_scope :tv_shows, :conditions => "strSeriesId IS NOT NULL AND strSeriesId <> ''"
  named_scope :movies, :conditions => "strSeriesId IS NULL OR strSeriesId = ''"
  
  def title; strTitle; end
  def episode; iEpisode; end
  def description; strDescription; end
  def path; strPath; end
  def season; iSeason; end
  def rating; strMPAARating; end
  def tag_line; strTagLine; end
  def release_date; (iReleaseDate > 0) ? iReleaseDate : nil; end
  def genre; strGenre; end
    
  def full_title
    t = season_and_episode || ''
    t << " " << self.title
  end
  
  def season_and_episode
    t = String.new
    t << "Season #{season} " if !season.nil? && season > 0
    t << "Episode #{episode} " if !episode.nil? && episode > 0
  end
  
  def is_tv?
    return !series.blank?
  end
  
  def is_movie?
    !is_tv?
  end
  
  def to_s; full_title; end
end
