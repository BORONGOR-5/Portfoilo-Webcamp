class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  has_many :reviews
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true
  validates :is_deleted, inclusion: {in: [true, false]}

  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def self.search(word)
    self.where(['lname LIKE ?', "%#{word}%"])
  end
end
