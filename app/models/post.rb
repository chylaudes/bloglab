class Post < ActiveRecord::Base
    belongs_to :author
    validates :title, :body, :catagory, presence:true
    validates :title, length: {minimum: 3}
end