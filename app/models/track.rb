# == Schema Information
# Schema version: 20080723014801
#
# Table name: tracks
#
#  id           :integer         not null, primary key
#  album_id     :integer
#  name         :string(255)
#  sample       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  track_number :integer
#

class Track < ActiveRecord::Base
  file_column :sample
end
