class SessionsController < ApplicationController

    get '/signup' do
        redirect_if_logged_in
        erb :"sessions/signup"
    end

    post '/users' do
            # create new user
            # make sure user signs up with valid data
        user = User.new(params) # params is a hash with k/v pairs
        # if form is blank and user email is already in system, redirect to signup page to try again
        if user.name.blank? || user.email.blank? || user.password.blank?
            flash[:warning] = "Please input all fields."
            redirect '/signup'
        elsif User.find_by_email(params["email"])
            flash[:warning] = "Email is already associated with another account. Please try again."
            redirect '/signup'
        else
                # save new user
            user.save
                # create new session to remember user
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        end
    end

    get '/login' do
        redirect_if_logged_in
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
            flash[:error] = "Either email or password is incorrect. Please try again."
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end