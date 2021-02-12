class Item < ActiveRecord::Base
    belongs_to :box
    belongs_to :category
    belongs_to :user

    validates_presence_of :name
end