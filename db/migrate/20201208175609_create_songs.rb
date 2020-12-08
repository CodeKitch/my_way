class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :song
      t.string :musician
      t.string :genre
      t.datetime :year
    end
  end
end 