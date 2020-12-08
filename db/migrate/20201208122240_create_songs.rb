class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :song
      t.string :musician
      t.string :band
      t.string :genre
      t.datetime :year
      t.datetime :play_time
    end
  end
end