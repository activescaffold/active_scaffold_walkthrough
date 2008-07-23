# == Schema Information
# Schema version: 20080723014801
#
# Table name: artists
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base
end
