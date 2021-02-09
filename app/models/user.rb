class User < ActiveRecord::Base
    has_secure_password
    
    has_many :blog_posts
    has_many :items
    # has_many :categories, through: :items
    has_many :categories
    # has_many :boxes, through: :items
    has_many :boxes
end