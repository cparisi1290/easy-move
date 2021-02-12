class Box < ActiveRecord::Base
    belongs_to :user
    has_many :items
    has_many :categories, through: :items

    validates_presence_of :name
end