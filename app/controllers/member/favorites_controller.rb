class Member::FavoritesController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_correct_member

  def create
    @review = Review.find(params[:review_id])
    favorite = @review.favorites.new(member_id: current_member.id)
    if favorite.save
      flash[:notice] = "いいねしました。"
      redirect_to request.referer
    else
      flash[:notice] = "いいね出来ませんでした。"
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = @review.favorites.find_by(member_id: current_member.id)
    if favorite.present?
      favorite.destroy
      flash[:notice] = "いいねを取り消しました。"
      redirect_to request.referer
    else
      flash[:notice] = "いいねを取り消し出来ませんでした。"
      redirect_to request.referer
    end
  end
end
