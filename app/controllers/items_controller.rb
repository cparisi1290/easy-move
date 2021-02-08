class ItemsController < ApplicationController

    get '/' do
        @items = Item.all
        erb :'users/show'
    end
end