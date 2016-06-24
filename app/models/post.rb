class Post < ActiveRecord::Base

   validates :title, presence: true
   validates :username, presence: true
   has_many :comments

end
