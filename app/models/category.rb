class Category < ActiveRecord::Base
    belongs_to :user
    has_many :items
    has_many :boxes, through: :items

    validates_presence_of :name
end