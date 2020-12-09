class CreateMySongs < ActiveRecord::Migration[5.2]
  def change
    create_table :my_songs do |t|
      t.string :rename
      t.string :style_of_remake
      t.string :add_note
      t.integer :song_id
      t.integer :user_id
    end
  end
end