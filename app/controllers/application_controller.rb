require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, '74jYypRExtL1CSpnBb0WKrFWg0WUSIdA'
  end

  get '/' do 
     "Welcome"
  end

  helpers do
      def logged_in?
          !!current_user
      end

      def current_user 
         @current_user ||=  User.find(session[:user_id]) if session[:user_id]
      end
  end


  helpers do 
    def valid_params?
        params[:flavor].none? do |k,v|
            v == ""
        end
    end
  end
  
  private 
    def redirect_if_not_logged_in
        if !logged_in?
            redirect '/login'
        end 
    end
end
