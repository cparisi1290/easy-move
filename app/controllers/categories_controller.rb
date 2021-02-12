class CategoriesController < ApplicationController


    get '/categories' do
        redirect_if_not_logged_in
        @categories = current_user.categories
        erb :"categories/index"
    end

    get '/categories/new' do
        redirect_if_not_logged_in
        erb :"categories/new"
    end

    post '/categories' do
        redirect_if_not_logged_in
        @category = Category.new(params)
        @category.user_id = current_user.id
        @category.save
        redirect "/categories/#{@category.id}"
    end

    get '/categories/:id' do
        redirect_if_not_logged_in
        find_category
        erb :"categories/show"
    end

    get '/categories/:id/edit' do 
        redirect_if_not_logged_in
        find_category
        erb :"categories/edit"
    end

    patch '/categories/:id' do
        redirect_if_not_logged_in
        find_category
        @category.update(params["user"])
        redirect "/categories/#{@category.id}"
    end

    delete '/categories/:id' do
        redirect_if_not_logged_in
        find_category
        @category.destroy
        redirect "/users/#{current_user.id}"
    end

    private

    def find_category
        @category = Category.find(params["id"])
    end
end