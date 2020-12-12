class MySongController < ApplicationController

    get '/my_songs' do 
        @my_songs = MySong.all
        @songs = Song.all
        erb :"my_songs/index" 
    end

    get '/my_songs/new' do 
        if !logged_in? 
            redirect '/login'
        end
        erb :"my_songs/new"
    end

    get '/my_songs/:id' do
        redirect_if_not_logged_in
        @my_song = MySong.find(params["id"])
        erb :"my_songs/show"
    end

    post '/my_songs' do 
        redirect_if_not_logged_in
        song = Song.new(params[:song])
        my_song = MySong.new(params[:my_song])
        my_song.song = song
        my_song.user_id = session[:user_id]
        my_song.save
        redirect '/my_songs'
    end

    get '/my_songs/:id/edit' do
        @song = Song.find(params["id"])
        @my_song = MySong.find(params["id"])
     
        redirect_if_not_authorized
        erb :"my_songs/edit"
    end

    put '/my_songs/:id' do
        @my_song = MySong.find(params["id"]) 
        redirect_if_not_authorized
        @my_song.update(params["my_songs"])
        redirect "/my_songs/#{@my_song.id}"
    end

    delete '/my_songs/:id' do 
        @my_song = MySong.find(params["id"])
        redirect_if_not_authorized
        @my_song.destroy
        redirect '/my_songs'
    end

    private 
    def redirect_if_not_authorized
        if @my_song.user != current_user
            redirect '/my_songs'
        end
    end
end