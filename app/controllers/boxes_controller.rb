class BoxesController < ApplicationController

    get '/boxes' do
        redirect_if_not_logged_in
        @boxes = current_user.boxes
        erb :"boxes/index"
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
        redirect "/boxes/#{@box.id}"
    end

    get '/boxes/:id' do
        redirect_if_not_logged_in
        find_box
        erb :"boxes/show"
    end

    get '/boxes/:id/edit' do
        redirect_if_not_logged_in
        find_box
        erb :"boxes/edit"
    end

    patch '/boxes/:id' do
        redirect_if_not_logged_in
        find_box
        @box.update(params["user"])
        redirect "/boxes/#{@box.id}"
    end

    delete '/boxes/:id' do
        redirect_if_not_logged_in
        find_box
        @box.destroy
        redirect "/users/#{current_user.id}"
    end

    private

    def find_box
        @box = Box.find(params["id"])
    end
end