class ItemsController < ApplicationController

    get '/users/show' do
        @items = Item.all
        redirect "/users/#{current_user.id}"
    end

    get '/items/new' do
        erb :"items/new"
    end

    post '/items' do
        @item = Item.new(params)
        @item.user_id = current_user.id
        @item.save
        redirect "/users/#{current_user.id}"
    end

    get '/items/:id' do
        find_item
        erb :"items/show"
    end

    get '/items/:id/edit' do 
        find_item
        erb :"items/edit"
    end

    patch '/items/:id' do
        find_item
        @item.update(params["user"])
        redirect "/items/#{@item.id}"
    end

    delete '/items/:id' do
        find_item
        @item.destroy
        redirect "/users/#{current_user.id}"
    end

    private

    def find_item
        @item = Item.find(params["id"])
    end
end