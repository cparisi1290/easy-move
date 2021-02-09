class BoxesController < ApplicationController

    get '/users/show' do
        @boxes = Box.all
        redirect "/users/#{current_user.id}"
    end

    get '/boxes/new' do
        erb :"boxes/new"
    end
end