class BlogPostsController < ApplicationController

    # READ display all blog posts
    get '/blog_posts' do
        redirect_if_not_logged_in        
        @blog_posts = BlogPost.all
        erb :"blog_posts/index"
    end

    # CREATE display form
    get '/blog_posts/new' do
        redirect_if_not_logged_in
        erb :"blog_posts/new"
    end

    # CREAT new blog post from current logged in user
    post '/blog_posts' do
        redirect_if_not_logged_in
        @blog_post = BlogPost.new(params)
        @blog_post.user_id = current_user.id 
        # blog_post = current_user.blog_posts.build(params)
        @blog_post.save
        redirect "/blog_posts/#{@blog_post.id}"
    end

    # READ display one particular blog post show page
    get '/blog_posts/:id' do
        redirect_if_not_logged_in
        find_blog_post
        erb :"blog_posts/show"
    end

    # UPDATE display form
    get '/blog_posts/:id/edit' do
        find_blog_post
        redirect_if_not_authorized
        erb :"blog_posts/edit"
    end

    # UPDATE 
    patch '/blog_posts/:id' do
        redirect_if_not_logged_in
        find_blog_post
        redirect_if_not_logged_in
        @blog_post.update(params["user"])
        redirect "/blog_posts/#{@blog_post.id}"

    end

    delete '/blog_posts/:id' do
        find_blog_post
        redirect_if_not_authorized
        @blog_post.destroy
        redirect '/blog_posts'
    end

    private

    def redirect_if_not_authorized
        if @blog_post.user != current_user
            redirect '/blog_posts'
        end
    end

    def find_blog_post
        @blog_post = BlogPost.find(params["id"])
    end
end