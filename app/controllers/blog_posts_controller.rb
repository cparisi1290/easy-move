class BlogPostsController < ApplicationController

    # READ display all blog posts
    get '/blog_posts' do
        @blog_posts = BlogPost.all
        erb :"blog_posts/index"
    end

    # CREATE display form
    get '/blog_posts/new' do
        if logged_in?
            erb :"blog_posts/new"
        else 
            redirect '/login'
        end
    end

    # CREAT new blog post from current logged in user
    post '/blog_posts' do
        if logged_in?
            blog_post = current_user.blog_posts.build(params)
            blog_post.save
            redirect '/blog_posts'
        else
            redirect '/login'
        end
    end

    # READ display one particular blog post show page
    get '/blog_posts/:id' do
        if logged_in?
            @blog_post = BlogPost.find(params["id"])
            erb :"blog_posts/show"
        else 
            redirect '/login'
        end
    end

    # UPDATE display form
    get '/blog_posts/:id/edit' do
        if logged_in?
            @blog_post = BlogPost.find(params["id"])
            erb :"blog_posts/edit"
        else 
            redirect '/login'
        end
    end

    # UPDATE 
    patch '/blog_posts/:id' do

    end


    delete '/blog_posts:id' do

    end
end