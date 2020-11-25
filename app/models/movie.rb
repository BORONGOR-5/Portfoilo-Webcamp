class Movie < ApplicationRecord
  has_many :reviews
  has_many :bookmarks, dependent: :destroy
  
  belongs_to :genre
  
  attachment :image
  
  validates :title, presence: true, length: {maximum: 30}
  # validates :image, presence: true
  validates :introduction, presence: true, length: {maximum: 400}
  
  def self.search(word)
    self.where(['title LIKE ?', "%#{word}%"])
  end
  
  def bookmarked_by?(member)
    bookmarks.where(member_id: member).exists?
  end
end
