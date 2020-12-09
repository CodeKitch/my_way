class MySongController < ApplicationController

    get '/my_songs' do 
        @my_songs = MySong.all
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
        @my_songs = MySong.find(params["id"])
        erb :"my_songs/show"
    end

    post '/my_songs' do 
        redirect_if_not_logged_in
        my_songs = current_user.my_songs.build(params)
        my_songs.save 
        redirect '/my_songs'
    end

    get '/my_songs/:id/edit' do
        @my_songs = MySong.find(params["id"])
        redirect_if_not_authorized
        erb :"my_songs/edit"
    end

    put '/my_songs/:id' do
        @my_songs = MySong.find(params["id"]) 
        redirect_if_not_authorized
        @my_songs.update(params["my_songs"])
        redirect "/my_songs/#{@my_songs.id}"
    end

    delete '/my_songs/:id' do 
        @my_songs = MySong.find(params["id"])
        redirect_if_not_authorized
        @my_songs.destroy
        redirect '/my_songs'
    end

    private 
    def redirect_if_not_authorized
        if @my_songs.user != current_user
            redirect '/my_songs'
        end
    end
end