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
end