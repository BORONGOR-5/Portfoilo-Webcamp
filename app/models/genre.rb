class Genre < ApplicationRecord
  has_many :movies
    
  validates :name, presence: true
  validates :is_active,  inclusion: {in: [true, false]}
end