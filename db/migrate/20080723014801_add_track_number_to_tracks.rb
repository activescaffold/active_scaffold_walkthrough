class AddTrackNumberToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :track_number, :integer
  end

  def self.down
    remove_column :tracks, :track_number
  end
end
