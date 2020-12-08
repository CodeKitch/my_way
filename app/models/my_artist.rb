class MyArtist < ActiveRecord::Base

    has_many :my_songs
    has_many :songs, through: :my_songs

end
  