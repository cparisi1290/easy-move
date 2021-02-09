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
        @item = Item.find(params["id"])
        erb :"items/show"
    end

    get '/items/:id/edit' do 
        @item = Item.find(params["id"])
        erb :"items/edit"
    end

    patch '/items/:id' do
        @item = Item.find(params["id"])
        @item.update(params["user"])
        redirect "/items/#{@item.id}"
    end
end