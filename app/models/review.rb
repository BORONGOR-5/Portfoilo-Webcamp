class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :member
  has_many :comment, dependent: :destroy
  has_many :favorites, dependent: :destroy
    
  validates :title, presence: true
  validates :impression, presence: true
  validates :rate, presence: true
    
  def favorited_by?(member)
    favorites.where(member_id: member).exists?
  end
end
