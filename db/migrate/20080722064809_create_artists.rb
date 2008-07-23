class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
