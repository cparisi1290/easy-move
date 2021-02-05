class UsersController < ApplicationController

    get '/users/:id' do
        @user = User.find(params["id"])
        # find user id to display their show page
        erb :"users/show"
    end
end