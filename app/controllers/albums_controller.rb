class AlbumsController < ApplicationController
  active_scaffold :albums do |config|
    config.columns = [:name, :album_cover, :price]
  end
end
