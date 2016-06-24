class Post < ActiveRecord::Base

   validates :title, presence: true
   validates :username, presence: true
   has_many :comments


   def upvote
    self.vote_count += 1
    self.save
   end
   
end
