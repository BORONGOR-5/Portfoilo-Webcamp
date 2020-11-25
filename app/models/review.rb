class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :member
  has_many :comment, dependent: :destroy
  has_many :favorites, dependent: :destroy
    
  validates :title, presence: true, length: {maximum: 30}
  validates :impression, presence: true, length: {maximum: 300}
  validates :rate, presence: true
    
  def favorited_by?(member)
    favorites.where(member_id: member).exists?
  end
end
