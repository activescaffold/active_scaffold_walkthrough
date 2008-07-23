class ArtistsController < ApplicationController
  active_scaffold :artist do |config|
    config.columns = [:name, :bio]
  end
end
