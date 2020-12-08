class Song < ActiveRecord::Base

    has_many :my_songs
    has_many :my_artists, through: :my_songs
    
end
  