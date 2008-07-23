class TracksController < ApplicationController
  active_scaffold :tracks do |config|
    config.actions << :sortable
    config.sortable.column = :track_number
    
    config.columns = [:name, :sample]
  end
end
