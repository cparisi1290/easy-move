class ItemsController < ApplicationController

    get '/users/show' do
        @items = Item.all
        erb :"users/show"
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
end