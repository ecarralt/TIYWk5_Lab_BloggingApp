class Post < ActiveRecord::Base

   validates :title, presence: true
   validates :vote_count, presence: true
   has_many :comments


   def upvote
    self.vote_count += 1
    self.save
   end

   def downvote
     self.vote_count -= 1
     self.save
   end

end
