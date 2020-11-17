class Movie < ApplicationRecord
  has_many :reviews
  
  belongs_to :genre
  attachment :image
  validates :title, presence: true
  # validates :image, presence: true
  validates :introduction, presence: true
end
