require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ez-move"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  not_found do
		status 404
		erb :status404
	end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      #    if @current_user
        #      @current_user 
        #    else 
        #     @current_user =  User.find(session[:user_id])
        #    end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to view this page."
        redirect '/'
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
      end
    end
  end

end
