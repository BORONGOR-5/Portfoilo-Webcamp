class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :review
  
  validates :review_comment, presence: true, length: {maximum: 300}
end
