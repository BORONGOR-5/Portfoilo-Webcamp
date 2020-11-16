class Movie < ApplicationRecord
  has_many :reviews
  
  validates :title, presence: true
  validates :introduction, presence: true
end
