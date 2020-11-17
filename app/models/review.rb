class Review < ApplicationRecord
    belongs_to :movie
    belongs_to :member
    has_many :comment
    
    validates :title, presence: true
    validates :impression, presence: true
    # validates :star, presence: true
end
