class ItemsController < ApplicationController

    get '/users/show' do
        redirect_if_not_logged_in
        @items = Item.all
        redirect "/users/#{current_user.id}"
    end

    get '/items/new' do
        redirect_if_not_logged_in
        erb :"items/new"
    end

    post '/items' do
        redirect_if_not_logged_in
        @item = Item.new(params)
        if @item.name.empty? 
            redirect '/items/new'
        else
            @item.user_id = current_user.id
            @item.save
            redirect "/users/#{current_user.id}"
        end
    end

    get '/items/:id' do
        redirect_if_not_logged_in
        find_item
        erb :"items/show"
    end

    get '/items/:id/edit' do
        redirect_if_not_logged_in
        find_item
        erb :"items/edit"
    end

    patch '/items/:id' do
        redirect_if_not_logged_in
        find_item
        @item.update(params["user"])
        redirect "/items/#{@item.id}"
    end

    delete '/items/:id' do
        redirect_if_not_logged_in
        find_item
        @item.destroy
        redirect "/users/#{current_user.id}"
    end

    private

    def find_item
        @item = Item.find(params["id"])
    end
end