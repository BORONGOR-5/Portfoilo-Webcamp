class Movie < ApplicationRecord
  has_many :reviews
  has_many :bookmarks, dependent: :destroy
  
  belongs_to :genre
  
  attachment :image
  
  validates :title, presence: true
  # validates :image, presence: true
  validates :introduction, presence: true
  
  def bookmarked_by?(member)
    bookmarks.where(member_id: member).exists?
  end
end
