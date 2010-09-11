class Album < ActiveRecord::Base
  set_primary_key :idAlbum
  belongs_to :artist, :foreign_key=>'idArtist'
  has_many :audio_files, :foreign_key=>'idAlbum', :order=>'iTrackNumber'
  
  def title; strTitle; end
  def num_tracks; iNumTracks; end
  def duration; iDuration; end
  def image_url; strArtwork; end
  def description; strDescription; end
  def year; iYear; end
  def dropped; iDropped; end
  
  def to_s; title; end
end
