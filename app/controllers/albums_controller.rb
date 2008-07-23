class AlbumsController < ApplicationController
  active_scaffold :albums do |config|
    config.columns = [:name, :album_cover, :price, :artist, :release_date, :tracks]
  end
end
