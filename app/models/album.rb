# == Schema Information
# Schema version: 20080723014801
#
# Table name: albums
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  artist_id    :integer
#  release_date :date
#  price        :float
#  album_cover  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Album < ActiveRecord::Base
  file_column :album_cover, :magick => 
  { :versions => 
    {
      :thumb => {:size => "128x128"},
      :medium => {:size => "256x256"}
    }
  }
  
  has_many :tracks, :order => "track_number"
end
