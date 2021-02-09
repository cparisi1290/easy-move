class BoxesController < ApplicationController

    get '/users/show' do
        redirect_if_not_logged_in
        @boxes = Box.all
        redirect "/users/#{current_user.id}"
    end

    get '/boxes/new' do
        redirect_if_not_logged_in
        erb :"boxes/new"
    end

    post '/boxes' do
        redirect_if_not_logged_in
        @box = Box.new(params)
        @box.user_id = current_user.id
        @box.save
        redirect "/users/#{current_user.id}"
    end

    get '/boxes/:id' do
        redirect_if_not_logged_in
        find_box
        erb :"boxes/show"
    end

    private

    def find_box
        @box = Box.find(params["id"])
    end
end