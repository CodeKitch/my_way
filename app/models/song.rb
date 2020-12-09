class Song < ActiveRecord::Base

    has_many :my_songs
    has_many :users, through: :my_songs
    
end
  