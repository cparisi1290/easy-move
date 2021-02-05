class SessionsController < ApplicationController

    get '/signup' do
        erb :"sessions/signup"
    end

    post '/users' do
            # create new user
        @user = User.new(params)
            # save new user
        @user.save
            # create new session to remember user
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end

    get '/login' do
        erb :"sessions/login"
    end

    post '/login' do
        # if email & password are valid, create session & send to user dashboard
        # if invalid, redirect to login page
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else
            redirect '/login'
        end
    end

    
    get '/logout' do
        session.clear
        redirect '/'
    end
end