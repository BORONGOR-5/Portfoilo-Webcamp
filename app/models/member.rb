class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  has_many :reviews
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  
  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :following
  
  
  attachment :profile_image
  enum sex: %i( 男 女 その他 )

  validates :name, presence: true, length: {maximum: 20}
  validates :is_deleted, inclusion: {in: [true, false]}
  validates :introduction, length: {maximum: 140}
  validates :best1, length: {maximum: 30}
  validates :best2, length: {maximum: 30}
  validates :best3, length: {maximum: 30}
  
  def follow(member_id)
    relationships.create(following_id: member_id)
  end

  def unfollow(member_id)
    relationships.find_by(following_id: member_id).destroy
  end

  def following?(member)
    followings.include?(member)
  end
  
  #  ↓これだとエラーが出る
  # def follow(other_member)
  #   unless self == other_member
  #     self.relationships.find_or_create_by(following_id: other_member.id)
  #   end
  # end

  # def unfollow(other_member)
  #   relationship = self.relationships.find_by(following_id: other_member.id)
  #   relationship.destroy if relationship
  # end

  # def following?(other_member)
  #   self.followings.include?(other_member)
  # end 
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
end