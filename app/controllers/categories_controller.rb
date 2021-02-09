class CategoriesController < ApplicationController


    get '/users/show' do
        @categories = Category.all
        redirect "/users/#{current_user.id}"
    end

    get '/categories/:id' do
        find_category
        erb :"categories/show"
    end

    private

    def find_category
        @category = Category.find(params["id"])
    end
end