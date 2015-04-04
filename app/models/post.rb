class Post < ActiveRecord::Base
   attr_accessible :post

   validates :post, presence: true, :length => { :maximum => 140 }

   belongs_to :user

end
