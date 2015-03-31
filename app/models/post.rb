class Post < ActiveRecord::Base
   attr_accessible :post

  belongs_to :user

   #validates :post, length: {maximum: 140}, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

end
