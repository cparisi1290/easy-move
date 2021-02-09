class BoxesController < ApplicationController

    get '/users/show' do
        @boxes = Box.all
        redirect "/users/#{current_user.id}"
    end

    get '/boxes/new' do
        erb :"boxes/new"
    end

    post '/boxes' do
        @box = Box.new(params)
        @box.user_id = current_user.id
        @box.save
        redirect "/users/#{current_user.id}"
    end
end