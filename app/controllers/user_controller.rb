class UserController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post "/signup" do 

        usr = User.new(email: params["email"], password: params["password"])
        
        if usr.email.blank? || usr.password.blank? || User.find_by_email(params["email"])
           redirect '/signup'
        else
            usr.save 
            session[:user_id] = usr.id
            redirect '/my_songs'
        end
    end

    get '/login' do
        erb :"/users/login"
    end

    post '/login' do
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/my_songs'
        else
            redirect '/login'
        end
    end

    get '/logout' do 
        session.delete(:user_id)
        redirect '/signup'
    end
end