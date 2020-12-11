class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :song
      t.string :musician
      t.string :genre
      t.integer :year
    end
  end
end 