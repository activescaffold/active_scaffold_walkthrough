class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name
      t.integer :artist_id
      t.date :release_date
      t.float :price
      t.string :album_cover
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
