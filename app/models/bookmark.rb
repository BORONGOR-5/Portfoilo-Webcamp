class Bookmark < ApplicationRecord
    belongs_to :member
    belongs_to :movie
    
    validates :member_id, uniqueness: { scope: :movie_id }
end
