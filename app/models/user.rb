class User < ActiveRecord::Base
    validates_presence_of :name, :email, :password
    validates_uniqueness_of :email
    
    has_secure_password
    
    has_many :blog_posts
    has_many :items
    # has_many :categories, through: :items
    has_many :categories
    # has_many :boxes, through: :items
    has_many :boxes
end