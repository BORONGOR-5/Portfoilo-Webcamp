class Member::FavoritesController < ApplicationController
  before_action :authenticate_member!

  def create
    @review = Review.find(params[:review_id])
    favorite = @review.favorites.new(member_id: current_member.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    favorite = @review.favorites.find_by(member_id: current_member.id)
    if favorite.present?
      favorite.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
