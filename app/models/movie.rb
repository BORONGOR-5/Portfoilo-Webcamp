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
  
      #ソート機能
  def self.sort2(selection)
    case selection
      #評価の高い順
      when "1"
        return all.joins(:reviews).group(:id).order('avg(reviews.rate) desc')
        # return all.order(rate: :DESC)
      #評価の低い順
      when "2"
        return all.joins(:reviews).group(:id).order('avg(reviews.rate) asc')
        # return all.order(rate: :ASC)
      #レビューの多い順
      when "3"
        return all.joins(:reviews).group(:movie_id).order('count(movie_id) DESC')
        # return all.order(review: :DESC)
      #レビューの少ない順
      when "4"
        return all.joins(:reviews).group(:movie_id).order('count(movie_id) ASC')
      #投稿日の新しい順
      when "5"
        return all.order(created_at: :DESC)
      #投稿日の古い順
      when "6"
        return all.order(created_at: :ASC)
    end
  end
end
