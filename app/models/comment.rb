class Comment < ActiveRecord::Base

    validates :body, presence: true
    validates :username, presence: true
    validates :post_id, presence: true
    belongs_to :post

end
