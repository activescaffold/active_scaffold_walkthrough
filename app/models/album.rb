# == Schema Information
# Schema version: 20080722064809
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
end
