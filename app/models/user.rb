class User < ActiveRecord::Base

    has_many :my_songs 
    has_secure_password
    
end