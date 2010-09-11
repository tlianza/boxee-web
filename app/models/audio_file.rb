class AudioFile < ActiveRecord::Base
  set_primary_key :idAudio
  belongs_to :artist, :foreign_key=>'idArtist'
  belongs_to :album, :foreign_key=>'idAlbum'
  
  def path; strPath; end
  def title; strTitle; end
  def duration; iDuration; end
  def track; iTrackNumber; end
  def genre; strGenre; end
  
  def duration_str
    m = duration/60.0
    s = (m - m.floor)*60
    return "#{m.floor}:#{s.round}"
  end
  
  def to_s; title; end
  
end
