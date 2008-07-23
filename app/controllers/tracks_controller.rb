class TracksController < ApplicationController
  active_scaffold :tracks do |config|
    config.columns = [:name, :sample]
  end
end
