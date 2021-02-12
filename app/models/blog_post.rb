class BlogPost < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :title, :content

    def formatted_created_at
        self.created_at.strftime("%A, %d %b %Y %l:%M %p")
      end
end