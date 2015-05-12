class Post < ActiveRecord::Base
   attr_accessible :post, :user_id

   validates :post, presence: true, :length => { :maximum => 140 }

   belongs_to :user

end
