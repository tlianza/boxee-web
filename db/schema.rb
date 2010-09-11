# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "actor_to_video", :id => false, :force => true do |t|
    t.integer "idActor"
    t.integer "idVideo"
  end

  add_index "actor_to_video", ["idActor", "idVideo"], :name => "actor_to_video_idx", :unique => true

  create_table "actors", :primary_key => "idActor", :force => true do |t|
    t.text "strName"
  end

  add_index "actors", ["strName"], :name => "actors_strName_idx"

  create_table "album_to_song", :id => false, :force => true do |t|
    t.integer "idFile"
    t.integer "idAudio"
  end

  create_table "albums", :primary_key => "idAlbum", :force => true do |t|
    t.text    "strTitle"
    t.text    "strPath"
    t.integer "iNumTracks"
    t.integer "idArtist"
    t.integer "iDuration"
    t.text    "strArtwork"
    t.text    "strDescription"
    t.text    "strLanguage"
    t.text    "strGenre1"
    t.text    "strGenre2"
    t.text    "strGenre3"
    t.text    "strGenre4"
    t.text    "strGenre5"
    t.integer "iYear"
    t.integer "iVirtual"
    t.integer "iRating"
    t.integer "iDateAdded"
    t.integer "iDateModified"
    t.integer "iDropped"
  end

  add_index "albums", ["strPath"], :name => "albums_strPath_idx"
  add_index "albums", ["strTitle"], :name => "albums_strTitle_idx"

  create_table "artists", :primary_key => "idArtist", :force => true do |t|
    t.text "strName"
    t.text "strPortrait"
    t.text "strBio"
  end

  add_index "artists", ["strName"], :name => "artists_strName_idx", :unique => true

  create_table "audio_files", :primary_key => "idAudio", :force => true do |t|
    t.integer "idFile"
    t.text    "strPath"
    t.text    "strTitle"
    t.integer "idAlbum"
    t.integer "idArtist"
    t.integer "idArtist1"
    t.integer "idArtist2"
    t.integer "idArtist3"
    t.integer "idArtist4"
    t.integer "idArtist5"
    t.text    "strGenre1"
    t.text    "strGenre2"
    t.text    "strGenre3"
    t.text    "strGenre4"
    t.text    "strGenre5"
    t.integer "iYear"
    t.integer "iDuration"
    t.integer "iDateAdded"
    t.integer "iTrackNumber"
    t.integer "iDateModified"
  end

  add_index "audio_files", ["idAlbum"], :name => "audio_idAlbum_idx"

  create_table "director_to_video", :id => false, :force => true do |t|
    t.integer "idDirector"
    t.integer "idVideo"
  end

  add_index "director_to_video", ["idDirector", "idVideo"], :name => "director_to_video_idx", :unique => true

  create_table "directors", :primary_key => "idDirector", :force => true do |t|
    t.text "strName"
  end

  add_index "directors", ["strName"], :name => "directors_strName_idx"

  create_table "media_folders", :primary_key => "idFolder", :force => true do |t|
    t.text    "strPath"
    t.text    "strType"
    t.integer "iMetadataId"
    t.text    "strStatus"
    t.integer "iDateStatus"
    t.integer "iHasMetadata"
    t.integer "iDateAdded"
    t.integer "iDateModified"
    t.integer "iNeedsRescan"
  end

  add_index "media_folders", ["strPath", "strType"], :name => "media_folders_srtPath_strType_idx", :unique => true

  create_table "pictures", :primary_key => "idPicture", :force => true do |t|
    t.integer "idFile"
    t.text    "strPath"
    t.integer "iDate"
    t.integer "iDateAdded"
    t.integer "iHasMetadata"
    t.integer "iDateModified"
  end

  create_table "properties", :id => false, :force => true do |t|
    t.text "strName"
    t.text "strValue"
  end

  create_table "seasons", :primary_key => "idSeason", :force => true do |t|
    t.integer "idSeries"
    t.integer "iSeasonNum"
    t.text    "strPath"
    t.text    "strCover"
    t.text    "strDescription"
    t.text    "strLanguage"
    t.text    "strGenre1"
    t.text    "strGenre2"
    t.text    "strGenre3"
    t.text    "strGenre4"
    t.text    "strGenre5"
    t.integer "iYear"
    t.integer "iVirtual"
  end

  create_table "series", :primary_key => "idSeries", :force => true do |t|
    t.text    "strTitle"
    t.text    "strPath"
    t.text    "strCover"
    t.text    "strDescription"
    t.text    "strLanguage"
    t.text    "strGenre1"
    t.text    "strGenre2"
    t.text    "strGenre3"
    t.text    "strGenre4"
    t.text    "strGenre5"
    t.integer "iYear"
    t.integer "iVirtual"
  end

  add_index "series", ["strTitle"], :name => "series_strTitle_idx", :unique => true

  create_table "version", :force => true do |t|
    t.integer "iVersion"
  end

  create_table "video_files", :primary_key => "idVideo", :force => true do |t|
    t.integer "idFile"
    t.text    "strPath"
    t.integer "idFolder"
    t.text    "strTitle"
    t.integer "iDuration"
    t.text    "strType"
    t.integer "idSeries"
    t.integer "iSeason"
    t.integer "iEpisode"
    t.text    "strDescription"
    t.text    "strExtDescription"
    t.text    "strIMDBKey"
    t.text    "strMPAARating"
    t.text    "strCredits"
    t.text    "strStudio"
    t.text    "strTagLine"
    t.text    "strCover"
    t.text    "strLanguage"
    t.text    "strGenre1"
    t.text    "strGenre2"
    t.text    "strGenre3"
    t.text    "strGenre4"
    t.text    "strGenre5"
    t.integer "iYear"
    t.text    "strTrailerUrl"
    t.text    "strShowTitle"
    t.integer "iDateAdded"
    t.integer "iHasMetadata"
    t.integer "iRating"
    t.integer "iDateModified"
    t.integer "iDropped"
  end

  add_index "video_files", ["strPath"], :name => "video_files_strPath_idx"

  create_table "video_parts", :primary_key => "idPart", :force => true do |t|
    t.integer "idVideo"
    t.integer "iPartNumber"
    t.text    "strPath"
  end

  add_index "video_parts", ["strPath"], :name => "video_parts_strPath_idx", :unique => true

end
