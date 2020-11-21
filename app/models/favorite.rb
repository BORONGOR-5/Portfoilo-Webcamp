class Favorite < ApplicationRecord
    belongs_to :member
    belongs_to :review
    
    validates :member_id, uniqueness: { scope: :review_id }
end
