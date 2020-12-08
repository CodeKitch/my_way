class MySong < ActiveRecord::Base

    belongs_to :song
    belongs_to :my_artist
    belongs_to :user

end
  