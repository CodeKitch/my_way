class UserController < ApplicationController

    get '/signup' do
        erb :"users/new_user"
    end

    post "/signup" do 

        user = User.new(email: params["email"], password: params["password"])
        
        if user.email.blank? || user.password.blank? || User.find_by_email(params["email"])
           redirect '/signup'
        else
            user.save 
            session[:user_id] = user.id
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