class BlogPostsController < ApplicationController

    # READ display all blog posts
    get '/blog_posts' do
        @blog_posts = BlogPost.all
        erb :"blog_posts/index"
    end

    # CREATE display form
    get '/blog_posts/new' do

    end

    # CREAT new blog post from user
    post '/blog_posts' do

    end

    # READ display one particular blog post show page
    get '/blog_posts/:id' do
        
    end

    # UPDATE display form
    get '/blog_posts/:id/edit' do

    end

    # UPDATE 
    patch '/blog_posts/:id' do

    end


    delete '/blog_posts:id' do

    end
end