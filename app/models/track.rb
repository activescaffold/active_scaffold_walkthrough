# == Schema Information
# Schema version: 20080722064809
#
# Table name: tracks
#
#  id         :integer         not null, primary key
#  album_id   :integer
#  name       :string(255)
#  sample     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  file_column :sample
end
