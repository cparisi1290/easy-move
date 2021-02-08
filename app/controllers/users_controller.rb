class UsersController < ApplicationController

    get '/users/:id' do
        @user = User.find_by(id: session[:user_id])
        redirect_if_not_logged_in
        # find user id to display their show page
        erb :"users/show"
    end
end