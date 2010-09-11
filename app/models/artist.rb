class Artist < ActiveRecord::Base
  set_primary_key :idArtist
  has_many :audio_files, :foreign_key=>'idArtist', :order=>'iYear DESC, idAlbum, strTitle'
  has_many :albums, :foreign_key=>'idArtist', :order=>'iYear DESC, strTitle'
  
  def image_url; strPortrait; end
  def name; strName; end
  def to_s; name; end
end
