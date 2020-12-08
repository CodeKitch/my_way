class CreateMySongs < ActiveRecord::Migration[5.2]
  def change
    create_table :my_songs do |t|
      t.boolean :do_original_name
      t.string :rename
      t.boolean :do_original_style
      t.string :style_of_genre
      t.boolean :do_electronic_production
      t.string :electronic_production_description
      t.boolean :do_sample_original
      t.string :sample_description
      t.boolean :do_with_band
      t.string :with_band_description
      t.boolean :do_as_instrumental
      t.string :instrumental_description
      t.boolean :do_use_intrumental
      t.string :use_intrumental_description
      t.boolean :do_rewrite_lyrics
      t.string :rewrite_lyrics_description
      t.boolean :do_add_notes
      t.string :add_notes_description
      t.integer :artist_id
      t.integer :song_id
      t.integer :user_id
    end
  end
end